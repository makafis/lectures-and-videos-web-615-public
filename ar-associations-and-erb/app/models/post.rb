class Post < ActiveRecord::Base
  belongs_to :author
  
  has_many :post_tags
  has_many :tags, :through => :post_tags #  tags, tags=, tags<< tags.build

  def summary
    content = self.content
    sentences = content.split(".")
    "#{sentences[0..1].join(".")}..."
  end

  def add_tag(tag)
    self.post_tags.create(:tag => tag)
    # self.tags << tag
  end
end
