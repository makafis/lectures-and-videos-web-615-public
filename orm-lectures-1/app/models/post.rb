class Post
  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :title => "TEXT",
    :content => "TEXT",
    :author_name => "TEXT"
  }
  def self.attributes
    ATTRIBUTES
  end

  extend Persistable::ClassMethods
  include Persistable::InstanceMethods


  attr_accessor *public_attributes
  attr_reader :id

end
