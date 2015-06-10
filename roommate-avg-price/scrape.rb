require 'open-uri'
require 'nokogiri'
require 'pry'

html = open("http://newyork.craigslist.org/search/roo").read

doc = Nokogiri::HTML(html)

elements = doc.search("span.price")


prices = elements.collect{|e| e.text.gsub("$", "").to_i}

sum_of_prices = prices.inject(:+)

puts "The average price of a room is #{sum_of_prices/prices.size.to_f}"

binding.pry