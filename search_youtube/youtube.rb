require 'open-uri'
require 'nokogiri'
require 'pry'

puts "What would you like to see?"

query = gets.strip

html = open("https://www.youtube.com/results?search_query=#{query}").read

doc = Nokogiri::HTML(html)

href = doc.search("h3.yt-lockup-title a.yt-uix-tile-link").first.attr("href")

system("open https://youtube.com#{href}")