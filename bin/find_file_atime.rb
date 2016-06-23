#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com


files_hash = Hash.new
Dir.glob("**/*.*") do |file_name|
  
  assess_time = File.new(file_name).mtime
  unless file_name == '.' || file_name == '..' then
    files_hash[file_name] = assess_time if File.size(file_name) > 100000000
  end
end

# Sort the hash.
files_hash = files_hash.sort_by {|key, value| value}

files_hash.each do |name, time|
   puts "#{name} was assess at #{time}"
end


