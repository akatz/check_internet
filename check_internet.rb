#!/usr/bin/ruby

require 'rubygems'
require 'curb'

unless ARGV.size == 2
  puts "Usage: \n #{$0} url delay"
  exit
end
url = ARGV[0]
delay = ARGV[1]

puts "Checking " + url + " every " + delay + " seconds"

while 1
  time = Time.now
  # url = URI.parse('http://www.google.com')
  begin
    p = Curl::Easy.perform(url).response_code
    elapsed_time = Time.now - time
    puts "Time " + elapsed_time.to_s + " response " + p.to_s
  rescue Curl::Err::HostResolutionError
    puts "Not Connected"
  end
  
  sleep delay.to_i
end