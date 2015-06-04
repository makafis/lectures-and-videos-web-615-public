# So far we've learned how to add elements to an array via an index.
candies = []
candies[0] = "Twix"

# And then we can access that data by querying that index.
candies[0] #=> "Twix" (we use #=> to represent a return value)

# This quickly breaks down as we constantly need to know exactly what index
# we're targeting. Think about the obvious functionality of adding an element
# to the end of an array. How would you accomplish that?

# We need to know the current size of the array and then insert an element
# into that position.

# Right now the candies array has 1 element, at 0 index, so it's size is 1.
# Arrays come with a length method:
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-length
candies.length #=> 1

# Given that, we could simply insert a new element into that index as we know
# that if the array is of size 1, the next available index is 1.
candies[candies.length] = "Snickers"

# But that's pretty verbose and there is a better way to add an element to the
# end of an array, it's simple called "push".
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-push
candies.push("Kit Kat") 


candies #=> ["Twix", "Snickers", "Kit Kat"]
candies.size #=> 3 (size is an alias for length).

# A prettier alias for push is the 'shovel' operator (<<)
candies << "Skittles"

arr = [1,2,3]
arr[0]
arr.[](0)
arr.value_at(0)

# Another way you can add data to an array is via concat.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-concat
candies.concat(["Gummy Bears", "Gummy Worms"])
candies #=> ["Twix", "Snickers", "Kit Kat", "Gummy Bears", "Gummy Worms"]

# So from it's usage, concat seems to be a type of merge operation, combining
# the two arrays together, adding the new elements at the end of the array.

# When adding data to an array, it's important to note at what end of the array
# the data is being added, so far, we've seen data only added to the end
# via push and concat.

# Let's look at adding data to the beginning of an array via unshift.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-unshift
candies.unshift("Twizzlers") # Note that unshift takes an arbitrary amount of arguments.
candies #=> ["Twizzlers", Twix", "Snickers", "Kit Kat", "Gummy Bears", "Gummy Worms"]

# Finally, there's a really useful method for adding data to a specific index
# and shifting the rest of the array appropriately, called insert.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-insert
candies.insert(2, "Hershey's", "Mounds")
candies #=> [
  # "Twizzlers", "Twix", 
  # "Hershey's", "Mounds", 
  # "Snickers", "Kit Kat", 
  # "Skittles", 
  # "Gummy Bears", "Gummy Worms"
# ]

# There even more ways to add data to an array but that covers the basic, with 
# push (and << ) being the most common.
