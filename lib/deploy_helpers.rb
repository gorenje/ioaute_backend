module DeployHelpers

  module Utils
    def dnslookup(servername_or_ip)
      require 'resolv'
      # this attempts to get around a 
      #     lib/ruby/1.8/resolv.rb:600:in 
      #              `initialize': wrong number of arguments (0 for 1) (ArgumentError)
      # error.
      last_exp = nil
      3.times do
        begin
          return Resolv.getaddress(servername_or_ip)
        rescue Exception => e ; last_exp = e ; end
      end
      raise ArgumentError, "Resolv failed for #{servername_or_ip} - try again: #{last_exp.to_yaml}"
    end

    def puts_debug(str)
      puts str if debug
    end

    def monit_server_name(servers)
      servers.inject({}) { |t,(name,ip,monit)| t.merge!(name=>monit||name)}
    end

    def services_per_server(monit_services, only_for_job=nil)
      retval = monit_services.inject({}) do |t, (server_name, services)|
        services[:scripts].each do |script_name|
          script_name = script_name.to_sym
          t[script_name] = (t[script_name] || []) << dnslookup(server_name)
        end
        t
      end
      (only_for_job && (retval[only_for_job.to_sym] || {})) || retval
    end

    def fetch_with_prompt(name, default_value)
      value = fetch(name, default_value)
      print "Enter value for #{name} (#{value}): "
      read_value = STDIN.readline.chomp
      (!read_value.nil? and !read_value.empty? and read_value) || value
    end

    def git_commit(svn_revision)
      c = `git log --grep="git-svn-id.*@#{svn_revision}" | head -1`
      c = "commit NoneSvnRebase" if c.nil? or c.empty? 
      "\nGit-Commit #{c.split.last}"
    end

    def get_revision(current_path, for_host=nil)
      opts = for_host.nil? ? {} : {:only => {:host_ip => for_host.options[:host_ip]}}
      get "#{current_path}/REVISION", "tmp/REVISION.ids", opts
      File.open("tmp/REVISION.ids").read.strip
    end

    def run_with_rvm(rversion, working_directory, &block)
      run((["source ~/.rvm/scripts/rvm || echo", 
            "cd #{working_directory}", "rvm use #{rversion}"] + 
           [yield].flatten).join(" && "))
    end
  end

  module Bindings
    def generate_default_opts(server_def, current_path)
      { :extras => { 
          :server_hostname => server_def.host,
          :appdir          => current_path
        },
        :for_server  => server_def.host,
        :for_host_ip => server_def.options[:host_ip]
      }
    end
    
    def generate_binding(default_prefix,opts={})
      b = binding
      ([default_prefix] + (opts[:extra_prefixes]||[])).each do |prefix|
        @variables.keys.select { |key_name| key_name.to_s =~ /^#{prefix}_/ }.each do |key_name|
          if @variables[key_name].kind_of?(Hash) and opts[:for_server]
            eval("#{key_name.to_s.gsub(/^#{prefix}_/,'')} = @variables[:#{key_name}][\"#{opts[:for_server]}\"]", b)
          else
            eval("#{key_name.to_s.gsub(/^#{prefix}_/,'')} = @variables[:#{key_name}]", b)
          end
        end
      end
      # add any extras if defined
      (opts[:extras]||{}).each { |key,value| eval("#{key.to_s} = \"#{value}\"", b) }
      b
    end

    def generate_binding_for_javascript_changes(opts={}) ; generate_binding("jsch", opts) ; end
    def generate_binding_for_create_users(opts={}) ; generate_binding("crus", opts) ; end
    def generate_binding_for_nginx_conf(opts={}) ; generate_binding("ngx", opts) ; end
    def generate_binding_for_install_geo_data(opts={}) ; generate_binding("geod", opts) ; end
    def generate_binding_for_monitrc(opts={}) ; generate_binding("monit",opts) ; end
  end
end
