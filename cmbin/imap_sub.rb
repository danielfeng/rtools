#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require 'net/imap'
require "mail"

server = "192.168.173.77"   
user = "admin"        
pass = "123"        
folder = "INBOX"

imap = Net::IMAP.new(server)
imap.login(user, pass)
imap.select(folder)

mailIds = imap.search(['ALL'])
mailIds.each do |id|
 msg = imap.fetch(id, "ENVELOPE")[0].attr["ENVELOPE"]
 sub = msg.subject
 value  = Mail::Encodings.value_decode(sub)
 p value
end  

imap.logout
imap.disconnect