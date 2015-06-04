# Besides adding and removing data from an array, we are also interested in 
# being able to introspect (or query the array, basically ask it questions
# about itself).

# Ruby provides a lot of interesting methods that make introspection easy.

# Size
puts [1,2,3].count #=> 3
puts [1,2,3].size #=> 3
puts [1,2,3].length #=> 3

# Position
[1,2,3,4,5,6].first #=> 1
[1,2,3,4,5,6].last #=> 6

# Querying the Array

# Find the index of an element in an array
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-index
["a","b","c"].index("b") #=> 1
[1,2,3].index(4) #=> nil

# Does the array include an element?
[1,2,3,4,5,6].include?(1) #=> true
[1,2,3,4,5,6].include?(7) #=> false

# Returning Modifications
# You can also do a bunch of bulk change operations on an array.

# For instance, let's say you have an array with a bunch of nil values
# you can get rid of them in one sweep with compact
array_with_nils = [nil, 1, nil ,3]
array_with_nils.compact #=> [1,3]

# What's nice about compact is that it returns a modified array without altering
# the original array.
array_with_nils #=> [nil, 1, nil ,3]

# Generally, we chain operations onto a compacted array.
array_with_nils.compact.each do |i|
  # Given this block, why did we need to compact this array first?
  # Why couldn't we just call i.odd? on those nil elements?
  # Try this code without first running compact.
  puts "odd" if i.odd? 
end

# It's pretty common to see an array with duplicate data and only wanting
# unique elements. The uniq method is great for this.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-uniq
primary_colors = ["red", "red", "green", "blue"]
primary_colors.uniq #=> ["red","green","blue"]

# Like compact, uniq is a non-modifying, non-destructive array, it returns
# a modified copy of the array, leaving the original intact.
primary_colors #=> ["red", "red", "green", "blue"]

# Sometimes when we push and concat a bunch of data from other arrays we can
# unintentionally create a nested structure to our array that we don't want.
people = []
students = ["Arel", "Logan", "Sara"]
people << students
people #=> [
  # ["Arel", "Logan", "Sara"]
# ]

# This is a nested array, with two levels deep, an array, within an array.
# There are 3 people, but if we ask the people array it's size, we get 1, not 3.
people.size #=> 1 # as it has only element.

# For this, we'd want to flatten the array, remove it's nested structure. 
# Ruby provides the flatten method for this.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-flatten
people.flatten #=> ["Arel", "Logan", "Sara"]

# Again, this flatten isn't a destructive method, the people array is still nested.
# All these methods are mostly used in chains.

# If you wanted to take the elements of an array and convert them to a string
# joined with a common delimiter, you can do that with the join method.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-join
ingredients = ["turkey", "bacon", "lettuce", "tomato"]
club_sandwidch = ingredients.join(" BREAD ")
club_sandwidch #=> "turkey BREAD bacon BREAD lettuce BREAD tomato
ingredients #=> ["turkey", "bacon", "lettuce", "tomato"]

# Finally, just for fun, like strings, arrays elements can be reversed, in 
# a non-destructive manner.
numbers = [1,2,3]
numbers.reverse #=> [3,2,1]
numbers #=> [1,2,3]
