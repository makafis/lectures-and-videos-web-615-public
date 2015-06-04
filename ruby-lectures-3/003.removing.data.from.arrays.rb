# As common as it is to add data, we also want to remove data from arrays

# Sometimes we want to just pop the last element off an array.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-pop
books = ["POODR", "Eloquent Ruby", "Well Grounded Rubyist"]
books.pop #=> "Well Grounded Rubyist"

# What's interesting about the pop method is that it returns to us the last
# element of the array, but it also modifies the actual array, removing that
# element forever.
books #=> ["POODR", "Eloquent Ruby"]

# Be careful when using methods that modify the original object in a manner
# where you can potentially lose data. As in, we can never find what the other
# book was, it's gone forever.

# If you wanted to get the first element of an array and remove it, sort of like
# the opposite direction of pop, the method to use is shift.
# http://www.ruby-doc.org/core-2.1.0/Array.html#method-i-shift
books.shift #=> "POODR"

# Much like pop, shift is also destructive, it modifies the original object,
# returning the element in the 0 index (first position), but also removing
# it permanently.
books #=> ["Eloquent Ruby"]

# Finally, sort of like insert, you have delete_at, which will remove an element
# at an exact index, returning it first.
books.delete_at(0) #=> "Eloquent Ruby"
books #=> []

# Something to think about, if pop and shift are destructive, why would they be
# useful? What's a common problem that might require constantly removing elements
# from the start or end of an array?