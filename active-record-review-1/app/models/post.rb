class Post < ActiveRecord::Base
  def summary
    content = self.content
    sentences = content.split(".")
    "#{sentences[0..1].join(".")}..."
  end
end