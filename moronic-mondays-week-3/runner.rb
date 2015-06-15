require 'pry'

# Main
require_relative './artist'
require_relative './song'

kanye = Artist.new
kanye.name = "Kanye West"

runaway = Song.new
runaway.artist = kanye #=> "I assigned the artist of Runaway to Kanye"


kanye.songs #=> I could expect that kanye's songs include the song runaway

binding.pry

puts "STOP!!!"

