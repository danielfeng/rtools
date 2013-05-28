#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require "rubygems"
require ('parseconfig.rb')

config=ParseConfig.new('./example.cf')

config.get_params()
config['param1']

config.get_groups()
config['group1']

config['group1']['group1_param1']
