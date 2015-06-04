# There's a concept known as variable scope.
# Scope is the context (or location) that the variable is defined.
# Only variables that are within scope are accessible or usable.
scoped = "Test"

# Blocks as Scope Gates
[1,2,3,4,5].each do # Open Scope Gate  
  scoped = "Within the Loop" # Block Scope
end # Close Scope Gate
# Back to Current Scope


# the defined? method can check if a variable is defined.
puts defined?(scoped)

# It's clear that variables defined within a block are not
# in scope outside the block.

# However, variables defined outside of a block, in the main scope
# are accessible within a block.
hello_string = "Hello, world!\n"

3.times do
  puts hello_string
  # We would have gotten an error if hello_string was considered
  # undefined within this block.
end

# So blocks have a shared scope, things defined outside of a block
# are accessible within the block, but variables defined exclusively
# within the block are not in scope outside of the block.

# Methods as Scope Gates
def within_method # Enter Method Scope
  invisible_outside = "now you see me"
end # Exit Method Scope

puts defined?(invisible_outside)

# Methods have a very exclusive scope, basically only variables defined
# within a variable are accessible.

def say_hello
  # puts hello_string
  # That line would throw an error, hello_string is undefined
  puts defined?(hello_string)
end











# So how do you get data from outside of a method into a method?
# Easy! That's what method arguments are for!
def say_hello(phrase)
  puts phrase
end
say_hello(hello_string)

# Notice that you can redefine methods in ruby whenever you want.

# An interesting thing about variable scope is that it allows the same
# bareword to have different values in different contexts.

# Take the following x for example.
x = 10 # At this point in time, x is equal to 10
y = 5

def square(x)
  puts "within the method x is " + x.to_s
  x = x*x
  puts "within the method x is " + x.to_s
end

puts "x is " + x.to_s # Still 10.
square(x) # Within this methods square, x will be equal to 100
puts "x is " + x.to_s # Back to 10.

# Tricky example showing shared scopes of blocks
i = "is a word"
puts i

# Block Scopes
[1,2,3,4,5,6].each do |i| # Enter Block Scope
  i = 789
end # Exit my Block Scope

puts i # What does i equal? Think about why.
