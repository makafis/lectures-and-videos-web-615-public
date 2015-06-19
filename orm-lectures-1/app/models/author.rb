class Author
  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :name => "TEXT"
  }
  def self.attributes
    ATTRIBUTES
  end

  extend Persistable::ClassMethods
  include Persistable::InstanceMethods


  attr_accessor *public_attributes
  attr_reader :id

end
