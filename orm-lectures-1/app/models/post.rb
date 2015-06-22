class Post < Persistable 
  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :title => "TEXT",
    :content => "TEXT",
    :author_name => "TEXT"
  }

  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

end

class Persistable
  def self.inherited(base)
    base.extend Persistable::ClassMethods
    base.include Persistable::InstanceMethods
  end
end
