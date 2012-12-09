#!/usr/bin/ruby

#require 'cakedb'
require './lib/cakedb.rb'

#@conn = Cake.new("localhost", 8888)
@conn = CakeDB.new
#@conn.write("a","cheese")
@conn.allSince("a", 0).each do |line|
  puts line["ts"].to_s + "|" + line["data"]
end

@conn.rangeQuery("a", 0, Time.now.to_i*1000000).each do |line|
  puts line["ts"].to_s + "|" + line["data"]
end

