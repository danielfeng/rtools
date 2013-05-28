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

databases ={

    :database => config['cm_logs_db']['Server']
    :username => config['cm_logs_db']['User']
    :password => config['cm_logs_db']['Password']
    #CM_DB_PORT = config['cm_logs_db']['Port']
    #CM_DB_IP = config['cm_logs_db']['Server']
    #CM_DB_USER = config['cm_logs_db']['User']
    #CM_DB_PASSWORD = config['cm_logs_db']['Password']
}
#databases = {
#    :cm_client => {
#        :database => '127.0.0.1',
#        :username => 'coremail',
#        :password => '4004083266',
#}    
#}

end_of_iter = ARGV.shift

databases.each do |name,config|
    if end_of_iter.nil?
        backup_file = config[:database] + '_' + Time.now.strftime('%Y%m%d')
    else
        backup_file = config[:database] + '_' + end_of_iter
    end
    mysqldump = "mysqldump -u#{config[:username]} -p#{config[:password]} " + "#{config[:database]}"
    `#{mysqldump} > #{backup_file}.sql`
    `gzip #{backup_file}.sql`
end

