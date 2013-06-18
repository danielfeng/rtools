#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

require "../lib/parseconfig.rb"

MYSQLDUMP = "/home/coremail/mysql/bin/mysqldump"
BACKUP_DIR = "/home/cmbackup"

def main()
  begin
    Dir.mkdir(BACKUP_DIR) and Dir.chdir(BACKUP_DIR) unless File.exists?(BACKUP_DIR) and Dir.chdir(BACKUP_DIR)
    backup_databases
  end
end

def backup_databases()
    config = ParseConfig.new('/home/coremail/conf/datasources.cf')
    databases ={
           :cm_client => {
           :server => config['cm_logs_db']['Server'],
         :username => config['cm_logs_db']['User'],
         :password => config['cm_logs_db']['Password'],
        }
    }   
  end_of_iter = ARGV.shift
  databases.each do |name,config|
    if end_of_iter.nil?
      backup_file = config[:server] + '_' + Time.now.strftime('%Y%m%d')
    else
      backup_file = config[:server] + '_' + end_of_iter
    end
      `#{MYSQLDUMP} -h#{config[:server]} -u#{config[:username]} -p#{config[:password]} \
      --all-databases --routines -q --single-transaction  > #{backup_file}.sql`
      `gzip #{backup_file}.sql`
  end
end

if __FILE__ == $0
  main
end