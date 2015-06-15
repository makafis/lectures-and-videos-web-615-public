class Song
  attr_accessor :artist  

  def artist=(artist)
    @artist = artist
    # I'd like to inform the artist object that it has a new song
    artist.songs << self
  end
end
