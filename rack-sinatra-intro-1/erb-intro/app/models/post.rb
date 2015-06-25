class Post < ActiveRecord::Base
  # Author must be the name of the other model
  # author_id must be the name of the FK column in posts
  belongs_to :author

  has_many :post_tags
  has_many :tags, :through => :post_tags

  def add_tags(tag_csv)
    # "tag 1, tag 2, tag 3"
    tag_csv.split(",").each do |tag_name|
      tag = Tag.find_or_create_by(:name => tag_name.strip)

      # self.tags << tag
      self.post_tags.build(:tag => tag)
    end
  end

end