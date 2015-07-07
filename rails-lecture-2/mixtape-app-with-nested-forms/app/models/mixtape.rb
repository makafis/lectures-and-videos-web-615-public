class Mixtape < ActiveRecord::Base
  has_many :songs

  validates :name, :presence => true

end
