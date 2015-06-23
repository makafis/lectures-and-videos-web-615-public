t1 = Tag.create(:name => "Tag 1")
t2 = Tag.create(:name => "Tag 2")
t3 = Tag.create(:name => "Tag 3")

p1 = Post.create(:title => "Post 1")
p2 = Post.create(:title => "Post 2")
p3 = Post.create(:title => "Post 3")

a1 = Author.create(:name => "Author 1")
a2 = Author.create(:name => "Author 2")

p1.author = a1
p1.save

p2.author = a2
p2.save

p3.author = a1
p3.save

PostTag.create(:post => p1, :tag => t1)
p1.post_tags.create(:tag => t2)

t3.post_tags.create(:post => p2)


