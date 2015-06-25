post_1 = Post.create(:title => "Another Blog Post", :content => "Another Content of Blog Post")
post_2 = Post.create(:title => "Another Blog Post", :content => "Another Content of Blog Post")
post_3 = Post.create(:title => "Another Blog Post", :content => "Another Content of Blog Post")
post_4 = Post.create(:title => "Another Blog Post", :content => "Another Content of Blog Post")

greene = Author.create(:name => "Greene")
hemingway = Author.create(:name => "H")

# 1. I want to add post_1, post_2 to an author.
greene.posts << [post_1, post_2]

# 2. I want to build an author for post 3 and for post 4
author_3 = post_3.build_author(:name => "Author of Post 3")
post_3.save
# author_3.save

author_3 = post_3.build_author(:name => "Author of Post 3")

# 3. Build two blog posts for hemingway 
post_5 = hemingway.posts.build(:title => "H Post 1")
hemingway.posts.create(:title => "H Post 2")
hemingway.save
