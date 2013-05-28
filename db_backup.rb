#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

databases = {
    :cm_client => {
        :database => '127.0.0.1',
        :username => 'coremail',
        :password => '4004083266',
}    
}

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
