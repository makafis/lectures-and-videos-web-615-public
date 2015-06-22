class Post
  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :title => "TEXT",
    :content => "TEXT",
    :author_name => "TEXT"
  }

  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

end