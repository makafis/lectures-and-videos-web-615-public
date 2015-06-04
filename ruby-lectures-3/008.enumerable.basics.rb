# The Enumerable Module, which is implemented by Hashes and Arrays
# have a bunch of methods that help extract data from them.

# map and collect are methods that will iterate over an array
# and return an array of altered values.

# square each element in an array and return the values
original = [1,2,3]
squares = original.map do |i|
  i*i
end
puts original.inspect
puts squares.inspect

# map/collect actually returns the values of the executed block.
# Each simply executes the block.
squares = original.each do |i|
  i*i
end
puts original.inspect
puts squares.inspect


# Another syntax for blocks besides the do |pipes| end is using {|pipes| }.
squares = original.map { |i| i*i }

# The general rules for which syntax to use is:
# {|p| } for single line blocks
# do/end for multi-line blocks

original.each { |i| puts i*i }

squares = original.map do |i|
  i*i
end