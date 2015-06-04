# Iteration means looping over elements within a collection.
# Objects that can do this are describe as Enumerable.

# 'each_char' is a method that will loop through each character.
# This loop begins with the 'do' keyword. It means the code that follows
# should be run for every character within the string.

"abcde".each_char do |x|
  puts "The value of x is: #{x}"
  puts "Is this character a vowel?"
end


# The code that follows is referred to as the 'block' for the loop.
# The code block is the logic or routine that is triggered each iteration.
vowels = /a|e|i|o|u|y/
y = nil

"abcde".each_char do |character|
  y = 1
  puts "#{character} is a vowel." if character.match(vowels)
end


puts "is y defined" defined?(y)

# '|character|' is refered to as the yield or iterator of the loop.
# it is the variable or name that is given to each character in the string.
# each character is yielded to the block as a variable named 'character'

# Within the block, the 'match' method is called on 'character'.

# The Array class is also an enumerable.
# Using the 'each' method



[1,2,3,4,5].each do |int|
  puts "#{int} is odd" if int.odd?

end


