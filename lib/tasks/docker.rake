require 'socket'
require 'timeout'

namespace :docker do
  task :create_database_yaml => :environment do
    hsh = {
      ENV['DB_ENV'] => {
        "pool"     => (ENV['DB_POOL']     || 5).to_i,
        "username" =>  ENV['DB_USER']     || 'root',
        "password" =>  ENV['DB_PASSWORD'] || 'password',
        "host"     =>  ENV['DB_HOST']     || 'host',
        "adapter"  =>  ENV['DB_ADAPTER']  || 'mysql2',
        "encoding" =>  ENV['DB_ENCODING'] || 'utf8',
        "port"     => (ENV['DB_PORT']     || 3306).to_i,
        "database" =>  ENV['DB_NAME']     || 'pubme'
      }
    }
    File.open('config/database.yml', "w+") << hsh.to_yaml
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
