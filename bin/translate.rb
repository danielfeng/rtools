#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require "open-uri" 
require "uri"
require "json"

if ARGV.empty?
 puts "Please enter the words need to be translated "
 return
end
 
escapParam=URI.escape("#{ARGV[0]}")

uri="http://fanyi.youdao.com/openapi.do?keyfrom=linyubingdomain&key=1462241743&type=data&doctype=json&version=1.1&q=#{escapParam}"
open(uri) do |http|
 html_res=http.read
 json = JSON::parse(html_res)
 puts "translation:   #{json['translation']}"
 puts "phonetic:      #{json['basic']['phonetic']}"
 puts "explains:      #{json['basic']['explains']}"
end

