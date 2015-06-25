# 20.times do |i|
#   Post.create(:title => "Post ##{i}", :content => "Content of Post ##{i}")
# end

bell = Post.new(:title => "For Whom the Bell Tolls", :content => "It's a long book.")
bell.author = Author.new(:name => "Hemingway") #

bell.save #=> How many SQL statements fire? How many rows are inserted?
# 1. INSERT INTO authors
# 2. INSERT posts

infinite_jest = Post.new(:title => "Infinite Jest")
infinite_jest.build_author(:name => "DFW") #=> #<Author>
infinite_jest.save #=> How many SQL statements fire? How many rows are inserted?
# 1. INSERT INTO authors
# 2. INSERT posts

fifty_shades = Post.new(:title => "50 Shades of Grade")
elj = fifty_shades.build_author(:name => "ELJ")
elj.save #=> How many SQL statements fire? How many rows are inserted?

rl_stein = Author.create(:name => "RL Stein")

g1 = Post.new(:title => "Goosebumps 1")
g2 = Post.new(:title => "Goosebumps 2")

rl_stein.posts << [g1, g2] # How many rows are inserted?
# 2 Statements then insert each post.

# rl_stein = Author.new(:name => "RL Stein")

# g1 = Post.new(:title => "Goosebumps 1")
# g2 = Post.new(:title => "Goosebumps 2")

# rl_stein.posts << [g1, g2] # How many rows are inserted?
# # 0, since Author (parent) is new, no SQLs fires
# rl_stein.save

ya = Tag.create(:name => "Young Adult")





