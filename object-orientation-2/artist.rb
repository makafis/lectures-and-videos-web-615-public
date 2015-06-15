class Artist
  attr_accessor :name, :rank
  extend Rankable::ClassMethods
  include Rankable::InstanceMethods
  extend Findable::ClassMethods


  @@all = []

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def initialize
    self.class.all << self
    @songs = []
  end

end

Artist.find_by_name("Kanye")


