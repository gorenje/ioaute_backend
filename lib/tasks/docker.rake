require 'socket'
require 'timeout'

namespace :docker do
  def recurse(env_prefix, key, value)
    env_lookup = "#{env_prefix}_#{key}".upcase

    if value.is_a?(Hash)
      {}.tap do |r|
        value.keys.each do |next_key|
          r[next_key] = recurse(env_lookup, next_key, value[next_key])
        end
      end
    else
      ENV[env_lookup] || value
    end
  end

  def setup_yaml(basename, base_prefix)
    hsh = YAML.load_file("config/#{basename}.yml")[ENV['DB_ENV']]

    res = {}.tap do |r|
      hsh.keys.each do |key|
        r[key] = recurse(base_prefix, key, hsh[key])
      end
    end

    File.open("config/#{basename}.yml", "w+") << {ENV['DB_ENV'] => res}.to_yaml
  end

  task :create_apis_yaml => :environment do
    setup_yaml("apis", "APIS")
  end

  task :create_database_yaml => :environment do
    setup_yaml("database", "DB")
  end

  task :pause_for_db => :environment do
    t = Thread.new { sleep(30); Kernel.exit(false) }
    begin
      port = (ENV['DB_PORT'] || 3306).to_i
      addr = Socket.getaddrinfo(ENV['DB_HOST'] || 'host', port)
      sock = Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0)

      sock.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
      sock.connect(Socket.pack_sockaddr_in(port, addr[0][3]))
      Kernel.exit(true)
    rescue Errno::ECONNREFUSED => e
      retry
    end
  end
end
