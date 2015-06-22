class Author
  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :name => "TEXT"
  }

  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

end
