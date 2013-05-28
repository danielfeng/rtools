#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require "./lib/parseconfig.rb"

config=ParseConfig.new('./conf/datasources.cf')

databases ={

    :cm_client => {
    :database => config['cm_logs_db']['Server'],
    :username => config['cm_logs_db']['User'],
    :password => config['cm_logs_db']['Password'],
}
}

end_of_iter = ARGV.shift

databases.each do |name,config|
    if end_of_iter.nil?
        backup_file = config[:database] + '_' + Time.now.strftime('%Y%m%d')
    else
        backup_file = config[:database] + '_' + end_of_iter
    end
    mysqldump = "/home/coremail/mysql/bin/mysqldump -u#{config[:username]} -p#{config[:password]} " + "#{config[:database]}"
    `#{mysqldump} > #{backup_file}.sql`
    `gzip #{backup_file}.sql`
end

