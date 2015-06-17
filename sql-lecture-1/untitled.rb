require 'pry'

db = SQLite3::Database.new("blog.db")

query = <<-SQL
  SELECT *
  FROM posts
  WHERE id > 2
SQL

rows = db.execute(query)

# [[3, "My title 2", "Body 2"], [4, "hi", "from ruby"]]
rows.each do |row|
  id = row[0]
  title = row[1]
  content = row[2]

  puts "#{id}. #{title}"
end
