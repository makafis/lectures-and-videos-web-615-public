class Post < ActiveRecord::Base

  def to_slug
    self.title.downcase.gsub(" ", "-")
  end
end
