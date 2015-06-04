# detect returns the first element for which the block is true
# find the first odd number.
first_odd = [2,4,16,15,22,7].detect do |i|
  i.odd?
end

# remember it returns the first element for which the block
# is true. What will this return?
first_odd = [2,4,16,15,22,7].find do |i|
  i.odd?
  true
end

# select returns all elements for which the block is true
# find all first odd number.
evens =  [2,4,16,15,22,7].select { |i| i.even? }
puts evens

# it returns all elements for which the block is true, 
# regardless of what else is in the block
evens = [2,4,6,5,7].select { |i| "#{i} is #{i.even?}" if i.even? }
puts evens

# reject returns all elements for which the block is true
# return only even numbers
puts [2,4,16,15,22,7].reject { |i| i.even? }.inspect

# all?
puts [1,2,3].all? { |i| i.is_a?(Intert) }
puts [1,2,3, "s"].all? { |i| true }

# any?
puts [1,2,3].any? { |i| i.is_a?(Integer) }

# none?
puts [1,2,3].none? { |i| i.is_a?(Integer) }

# inject
[1,2,3].inject { |memo, element| memo + element }

[2,3,4,6].inject([]) do |memo, e| 
  e.even? ? memo << "even" : memo << "odd"
end

orig = [1,"a",3,:b]

# There are two ways to sort an enumberable. 
# The sort method and the sort_by
# sort works by comparing pairs and scoring the difference
# sort_by creates an array of values for each object which is then sorted.
fruits = { :apple => 100, :banana => 10, :fig => 1000 }
sorted_by_calories = fruits.sort_by do |fruit, calorie_count|
  calorie_count
end

original = ["words", "avi", "banana" ]
{
  :element_1 => 5,
  :element_2 => 3,
  :element_3 => 7
}

sorted = ["words", "avi", "banana" ].sort_by do |w|
  w
end

sorted.reverse

iteration = 0
a = ["words", "avi", "banana" ].sort do |a, b|
  puts "On iteration #{iteration}"
  puts a.inspect
  puts b.inspect
  iteration += 1

  a <=> b
end

sorted_fruits = fruits.sort
sorted_fruits = fruits.sort { |a,b| a[1] <=> b[1] }
sorted_fruits = fruits.sort_by { |k, v| v }




