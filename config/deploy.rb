set :stages, %w(staging production prodbackup beta)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

require File.dirname(__FILE__) + '/../lib/deploy_helpers'
class << self
  include DeployHelpers::Bindings
  include DeployHelpers::Utils
end

set :application,        "website"
set :deploy_to,          "/var/app/#{application}"
set :user,               "deploy"
set :local_rails_root,   File.expand_path(File.join(File.dirname(__FILE__), ".."))
set :resources_location, "public/publications/Resources" # relative to current_path

set :scm,                   :git
set :repository,            "gitosis@dev.2monki.es:#{ENV['GITREPO'] || application}.git"
set :branch,                ENV["GITBRANCH"] || "master"
set :git_shallow_clone,     3
set :git_enable_submodules, 1 ## note, this does not work for deep modules only toplevel

# this is because Ubuntu uses 'dash' as sh (i.e. sh --> dash) and dash doesn't know 
# anything about 'source'. Strange but true ...
default_run_options[:shell] = "/bin/bash"

set :rvm_ruby_version, "ruby-1.9.2-head"

namespace :deploy do
  { ### After hooks
    "migrate"      => "restart",
    "symlink"      => "setup_paths",
    "setup_paths"  => ["build_editor", "run_remote_scripts", 
                       "generate_remote_files"],
    "build_editor" => "copy_resources",
  }.each do |after_task, before_tasks|
    [before_tasks].flatten.each do |before_task|
      after "deploy:#{after_task}", "deploy:#{before_task}" 
    end
  end

  { ### Before hooks
    "symlink"       => "setup_diff",
    "build_editor"  => ["bundle_install", "update_superglue"],
    "restart"       => ["show_diffs", "update_superglue", 
                        "bundle_install"],
  }.each do |before_task, after_tasks|
    [after_tasks].flatten.each do |after_task|
      before "deploy:#{before_task}", "deploy:#{after_task}" 
    end
  end

  desc "builds the editor and installs it into the public directory"
  task :build_editor do
    run_with_rvm(rvm_ruby_version, current_path) do
      "rake editor:install"
    end
  end
  
  desc "copy assets to the assets server"
  task :copy_resources do
    { 
      "moustache.png" => "images"
    }.each do |srcfile, targetdir|
      run "cp -f #{current_path}/#{resources_location}/#{srcfile} /var/www/assets/#{targetdir}"
    end
  end
  
  desc "update the superglue and make sure it's still holding things together"
  task :update_superglue do
    run "cd ~/superglue && git pull"
    run "cd ~/editor && git submodule init && git submodule update && git pull"
  end

  desc "install gems with bundle"
  task :bundle_install do
    run_with_rvm(rvm_ruby_version, current_path) { "gem install bundler" }
    run_with_rvm(rvm_ruby_version, current_path) { "bundle install" }
  end

  desc "Need to use rvm to call rake, i.e. migrate won't work otherwise."
  task :migrate, :roles => :db do
    run_with_rvm(rvm_ruby_version, current_path) do
      "RAILS_ENV=production rake db:migrate"
    end
  end

  desc "create various paths and replace symlinks"
  task :setup_paths do
    [
     # system folder is only used for maintenance, therefore whip it's ass
     [ "public/system", "#{shared_path}/system/maintenance"],

     # various yaml configurations
     ["config/apis.yml", 
      "#{shared_path}/system/config/apis.yml-#{application}"],
     ["config/database.yml", 
      "#{shared_path}/system/config/database.yml-#{application}"],

     # redirect the log symlink for log
     ["log", "#{shared_path}/#{application}/log"],
    ].each do |dest, src| 
      dest = "#{current_path}/#{dest}"
      run "rm -fr #{dest} && ln -snf #{src} #{dest}" 
    end

    # add symlink to the editor
    run "rm -f #{current_path}/../editor && ln -snf /home/deploy/editor #{current_path}/../editor"
  end

  desc "Generate files on the remote server"
  task :generate_remote_files do
    { 
      "nginx.conf" => "#{current_path}/config",
      "monitrc"    => "#{current_path}/config",
      "thin.yml"   => "#{current_path}/config",
      ".rvmrc"     => "#{current_path}",
    }.each do |configfile, remote_path|
      remote_path    = "#{remote_path}/#{configfile}"
      local_path     = "config/remote_files/#{configfile}.erb"
      local_file     = File.join(local_rails_root, local_path)
      erb            = ERB.new(File.open(local_file).read)
      perm_val       = ("%o" % File.stat(local_file).mode)[3..-1]
      binding_method = "generate_binding_for_#{configfile.gsub(/[.]/,'_')}"

      roles[:app].each do |server_def|
        put(erb.result( self.send(binding_method, 
                                  generate_default_opts(server_def,current_path))),
            remote_path, :only => { :host_ip => server_def.options[:host_ip] })

        run("chmod #{perm_val} #{remote_path}", 
            :only => {:host_ip => server_def.options[:host_ip]})

        @diff[server_def.host].
          merge!({ configfile => 
                   capture("diff -C 1 #{current_path}/#{local_path} " +
                           "#{remote_path} || echo",
                           :only => {:host_ip => server_def.options[:host_ip]})})
      end
    end
  end

  desc "Do stuff on the server to which we have just deployed"
  task :run_remote_scripts do
    [
     ## TODO add some!
    ].each do |basename|
      binding_method = "generate_binding_for_#{basename.gsub(/[.]/,'_')}"
      local_path     = File.join(local_rails_root, "config", "remote_scripts", 
                                 "#{basename}.erb")
      remote_path    = "#{current_path}/tmp/#{basename}"
      erb            = ERB.new(File.open(local_path).read)

      roles[:app].each do |server_def|
        put(erb.result(self.send(binding_method, 
                                 generate_default_opts(server_def,current_path))),
            remote_path, :only => { :host_ip => server_def.options[:host_ip] })
        run("ruby #{remote_path}", :only => {:host_ip => server_def.options[:host_ip]})
      end
    end
  end

  # Restart passenger on deploy
  desc "Restarting thin with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run_with_rvm(rvm_ruby_version, current_path) do
      "thin -C config/thin.yml restart" 
    end
  end

  # show all the diffs we did. this makes the deploy a little more understandable if
  # we have the differs at the end and all the "deploy stuff".
  task :show_diffs do
    puts "    All went well, just about to restart but first the differs"
    puts "    --8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<--8<"
    (@diff||{}).each do |server, diffs|
      puts "    ## Server: #{server}"
      diffs.each do |filename, diffstr|
        puts "    @@@@@@@@@@@@@@@@@@@ File: #{filename} @ #{server}"
        puts diffstr
      end
    end
    puts "    -->8-->8-->8-->8-->8-->8-->8-->8-->8-->8-->8-->8-->8-->8-->8"
  end
  task(:setup_diff) { @diff = Hash.new { |h,k| h[k] = Hash.new } }

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
