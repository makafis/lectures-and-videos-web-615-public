require "sqlite3"

# Open a database
db = SQLite3::Database.new "blog-posts.db"

puts "Name the author whose posts you'd like to read."

author_name = gets.strip

author_query = "SELECT posts.title FROM posts JOIN people ON posts.people_id = people.id WHERE people.name = ?"

results = db.execute(author_query, author_name)
# [["Post Title"]]

results.each do |post_array|
  puts post_array[0]
end

