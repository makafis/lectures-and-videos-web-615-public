class Song
  attr_accessor :name, :rank
  extend Rankable

  @@all = []

  def self.all
    @@all
  end

  def initialize
    self.class.all << self
  end

end

Song.top_5