require 'pry'

def reload!
  load './artist.rb'
  load './song.rb'
end

require_relative './rankable'

require_relative './artist'
require_relative './song'


kanye = Artist.new
kanye.name = "Kanye"
kanye.rank = 1

taylor = Artist.new
taylor.name = "Taylor"
taylor.rank = 2


Pry.start