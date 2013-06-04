#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require 'socket'
include Socket::Constants

socket = Socket.new(AF_INET, SOCK_STREAM, 0)
sockadd = Socket.pack_sockaddr_in( 6195, '192.168.173.174' )
if (socket.connect( sockadd ))
    puts "Connection OK"
    #if ( socket.call("cmd=5&user_at_domain=admin@testcloud.cn", "language=1&style=2") != True)
    #    puts "Login fail"
    #else :
    #    puts "Login OK SessionID:", socket.getResut()
    #    socket.close()
else
    puts "Connection fail"
end

