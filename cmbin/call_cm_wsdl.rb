#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require 'open-uri'

url = "http://192.168.173.77:9900/apiws/services/API/userLoginEx?user_at_domain=admin@albert.net&attrs=face%3DXJS"
page = open(url)
text = page.read


