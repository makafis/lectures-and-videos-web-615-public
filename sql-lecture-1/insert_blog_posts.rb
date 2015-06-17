require "sqlite3"

# Open a database
db = SQLite3::Database.new "blog-posts.db"

100.times do |i|
  sql = "INSERT INTO posts (title) VALUES (\"Title #{i}\")"  
  db.execute(sql)
end


sql = "UPDATE posts SET title = \"Hello World\" WHERE id = 1"
db.execute(sql)

sql = "DELETE FROM posts WHERE id = 1"