#
# Author: Gerrit Riessen, gerrit.riessen@open-source-consultants.de
# Copyright (C) 2010 Gerrit Riessen
# This code is licensed under the GNU Public License.
# 

require 'fileutils'

namespace :editor do
  desc <<-EOF
    This is run after the editor has been compiled by cappuccino. We then copy it
    across into the rails application and check it in.
  EOF
  task :install => :environment do
    src_dir = "#{Rails.root}/../editor/Build/Flatten/PublishMeEditor"
    dirname, base_dest_dir = File.basename(src_dir), "#{Rails.root}/public"

    unless src_dir.blank? or dirname.blank?
      puts ">>> Determined jake deploy directory to be '#{src_dir}'"
      FileUtils.rm_rf("#{base_dest_dir}/#{dirname}")
      puts `rsync -rlpgoD --delete --dirs --checksum  #{src_dir} #{base_dest_dir}/`
      # require because the editor uses relative paths for images and the editor
      # is accessed under ..../publications/new
      unless File.exists?("#{base_dest_dir}/publications")
        FileUtils.ln_s("#{base_dest_dir}/#{dirname}", "#{base_dest_dir}/publications") 
      end

      # add timestamp to the JS requests.
      application_js_file_count = 
        Dir.glob("#{base_dest_dir}/publications/Application?.js").count
      erb = ERB.new(File.open("#{Rails.root}/config/remote_files/Application.js.erb").read)
      File.open("#{base_dest_dir}/publications/Application.js", "w+") do |f|
        f << erb.result(binding)
      end
      
      editor_revision = `cd #{src_dir} && (git log | head -1 | colrm 1 7)`.strip
      File.open(File.join(base_dest_dir, "EDITOR_REVISION"), "w") {|f| f.puts(editor_revision)}
    end
  end
  
  desc <<-EOF
    Squash everything. This is only done on the server, after deploy.
  EOF
  task :squash => :environment do
    base_dest_dir = "#{Rails.root}/public"
    # gzip everything so that nginx doesn't need to do this each time.
    ( Dir.glob("#{base_dest_dir}/javascripts/*.js") +
      Dir.glob("#{base_dest_dir}/publications/**/*.txt") +
      Dir.glob("#{base_dest_dir}/publications/**/*.cib") +
      Dir.glob("#{base_dest_dir}/publications/**/*.js") +
      Dir.glob("#{base_dest_dir}/publications/**/*.j") +
      Dir.glob("#{base_dest_dir}/publications/**/*.plist") +
      Dir.glob("#{base_dest_dir}/publications/**/*.sj")
      ).each do |filename|
      `rm -f #{filename}.gz && gzip -9 -c #{filename} > #{filename}.gz`
    end
  end
end
