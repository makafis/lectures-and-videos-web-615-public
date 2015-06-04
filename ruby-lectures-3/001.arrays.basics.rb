puts "So far we're familiar with a few of the common ruby types."

puts "This is a string."

if 1.is_a?(Integer)
  puts "1 is an Integer"
end

puts "Another common type is an Array."
puts "An array is an indexed collection of objects."
puts "It has a bunch of slots and you can put data in them."

easy_as = ["a", "b", "c"]
easy_as[0] #=> returns "a", the first element in the array

puts easy_as

y = ["a","b","z"][1,2,3] #=> y would equal "b", the second element in the array

days_of_the_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# We access the data in an array by referring to the index (position) 
# of the desired element. Elements in an array are counted with the position
# starting at 0, so the first element in an array is in the 0 position. You can
# also refer to the last element in an array as -1, or you can count backwards
# using negative indexes.

puts "The first day of the week is: " + days_of_the_week[0]

puts "The last day of the week is: " + days_of_the_week[-1]

easy_as = [1,2,3]
easy_as[-2] == easy_as[1]

puts "A negative index position starts backwards."
puts "-1 means the first position after the last."
puts "-4 means the fourth position after the last."

puts days_of_the_week[-3]

puts "Finally, arrays are well aware of their size."

puts days_of_the_week.size

puts days_of_the_week[(days_of_the_week.size-1)]

puts "You can also grab a range of multiple values at once."

# This is called slicing
weekdays = days_of_the_week[1, 5]
puts weekdays

puts "Finally, you can also set the value of slots in the array using [index]="

empty = []
empty[0] = "filled!"

empty[5] = "also filled"
puts empty.inspect