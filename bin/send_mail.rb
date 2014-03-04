#!/usr/bin/env ruby
## Author : danielfeng
## E-Mail : danielfancy@gmail.com

msgstr = <<MESSAGE_END
From: Daniel <daniel@dn.com>
To: A Test User <admin@cmxt301.cn>
Subject: Test

Hello Daniel ! This is a test E-Mail message.
MESSAGE_END

require 'net/smtp'
smtp = Net::SMTP.start( '192.168.173.92' , 7250 ) 
smtp.send_mail msgstr, 'daniel@dn.com', 'admin@cmxt301.cn'
smtp.finish

