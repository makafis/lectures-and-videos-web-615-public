def countup_to(start = 1, finish)
  (start..finish).each do |i|
    puts i
  end
end

puts "Methods accept parameters. Parameters are sort of like adverbs, "
puts "they describe how a method should work."
puts "Parameters are the values we pass to a method."
puts "Parameter values are accessed within the method as a local variable of"
puts "the same name as the parameter."

countup_to(5)

puts "Once defined, a parameter is required to call the method."

begin # Ignore this implementation
  countup_to() # focus on this line - the method call without parameters
rescue => e
  puts "Error: #{e}"
end

puts "Method parameters can have defaults when they are declared."

def countup_to_from(to,from = 1)
  (from..to).each do |i|
    puts i
  end
end

countup_to_from(15)



puts "When a parameter has a default, it becomes optional."

countup_to_from(15, 5)
countup_to_from(10)

puts "You can even define a method to accept an unspecified number of parameters."


sum(1,2,43)

sum(1,5)

def sum(*numbers)
  numbers.inject(&:+)
end

puts sum(0,1,1,2,3,5,8)

puts "This is known as parameter globbing (or splat)."


# Assignment

# Modify your say_hello method to accept a parameter of a person's name
# and output that.

# Modify your say_hello method to default to your name when it says hello.

# Modify say_hello to accept an arbitrary amount of names to say hello to.
# The body of your method can be:

# names.each do |name| puts "Hello #{name}!"

# where names is the parameter the method accepts.

