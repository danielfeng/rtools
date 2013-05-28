#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

#require "rubygems"
require "./lib/parseconfig.rb"

config=ParseConfig.new('./conf/datasources.cf')

#config.get_params()
#puts config['param1']

#config.get_groups()
#puts config['group1']

puts config['cm_logs_db']['Port']
