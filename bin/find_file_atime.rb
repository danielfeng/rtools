#!/usr/bin/env ruby
# Author : danielfeng
# E-Mail : danielfancy@gmail.com

if ARGV.empty? 
  puts "Please enter the file size MB"
  return
end

files_hash = Hash.new
file_size = ARGV[0].to_i * 1000

Dir.glob("**/*.*") do |file_name|
  assess_time = File.new(file_name).atime
  unless file_name == '.' || file_name == '..' then
    files_hash[file_name] = assess_time if File.size(file_name) > file_size 
  end
end

# Sort the hash.
files_hash = files_hash.sort_by {|key, value| value}

files_hash.each do |name, time|
   puts "#{name} was assess at #{time}"
end


