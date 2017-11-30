require 'socket'
require 'timeout'

namespace :docker do
  task :pause_for_db, [:hostname, :port] => :environment do |t,args|
    t = Thread.new { sleep(30); Kernel.exit(false) }
    begin
      addr = Socket.getaddrinfo(args.hostname, args.port.to_i)
      sock = Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0)
      sock.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
      sock.connect(Socket.pack_sockaddr_in(args.port.to_i, addr[0][3]))
      Kernel.exit(true)
    rescue Errno::ECONNREFUSED => e
      retry
    end
  end
end
