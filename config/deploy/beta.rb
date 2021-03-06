##
## deploy for beta
##

SERVERS = [
           ["web.2monki.es", nil, "web.2monki.es"],
          ]

role :web, "web.2monki.es"
role :app, "web.2monki.es"
role :db,  "web.2monki.es", :primary => true

MONIT_SERVICES = { 
  "web.2monki.es" => {
    :daemons => ["nginx"],
    :scripts => [] 
  },
}

set :monit_delayed_job_priorities, ["1 1", "2 15"]
set :monit_nginx_init_script,      "/etc/init.d/nginx"
set :monit_server_name,            "VIEW"
set :monit_alert_emails,           ["gerrit.riessen@gmail.com"]
set :monit_monitor_interval,       123
set :monit_system_name,            monit_server_name(SERVERS)
set :monit_include_include,        false
set :monit_script_user,            "deploy.deploy"
set :monit_services,               MONIT_SERVICES
set :monit_require_server,         false
set :monit_smtp_address,           "mx.2monki.es"
set :monit_smtp_port,              25

# total memory usage (in MB) before script is restarted
set :monit_scripts_total_memory, "200.0"
set :monit_advertiser_importer_total_memory, "500.0"

set :ngx_ports, ["80"]
## Assume that the first server is the publication hosting server.
set :ngx_server_names, ["pubme.2monki.es"]
set :ngx_publication_server_names, ["pu.2monki.es"]
set :ngx_thin_sockets, 5 ## needs to be the same as thin_num_of_servers

set :thin_num_of_servers,       5
set :thin_environment,          "production"
set :thin_max_persistent_conns, 512
