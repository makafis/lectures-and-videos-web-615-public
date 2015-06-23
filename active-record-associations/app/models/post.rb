class Post < ActiveRecord::Base
  belongs_to :author

  def self.table_name
    "#{self.to_s.downcase}s"
  end


  def summary
    content = self.content
    sentences = content.split(".")
    "#{sentences[0..1].join(".")}..."
  end
end
