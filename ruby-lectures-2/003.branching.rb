puts "A program can take a certain path or flow based on an expression's value."

if (1 < 2) # true
  puts "Since 1 is less than 2, you see this line."
else
  puts "You will not see this line."
end




puts "That's a simple example of branching using the if, else, end keywords."

puts "You can use a variable to store the return value of an expression."
condition = (1 < 2)

if condition
  puts "The condition variable true because (1 < 2) is true."
end

puts "In fact, even an if statement is considered an expression."

value = if (1 > 2)
  puts "This string is returned as the value of the if statement expression."
else
  7
  8
end


puts value

puts "The Ruby interpreter does not require all the () though, they are implied."

readable_code = if 1 < 2
  "Leaving the implied () out makes for more readable code."
end

puts readable_code

x = 10
y = 100

x = 1

if x == 2
  puts "It's 2!"
elsif x == 1
  puts "it's 1"
elsif x.odd?
  puts "It's odd"
end










a = if x != 10
  puts "True."
  puts "test"
elsif y > 20
  "Still yes."
  4 #=> 4
elsif x > 4
  puts "That's elsif."
else
  1 > 2
  puts "hi"
end

# Assignment

# Write an if statement with 3 different branches
#   use !=, ==, and > in those branches

# Assign a variable based on the result of an if statement

# Execute code based on the result of an if statement.
#   conditionally run puts "Hello Class" if 1 < 2

# Try using an if statement at the end of an expression
