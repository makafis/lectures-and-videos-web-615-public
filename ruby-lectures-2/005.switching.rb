puts "if statements can get verbose and confusing."

x = 3
if x == 1 || x == 3
  puts "x is odd"
elsif x == 2 || x == 4
  puts "x is even"
end


even_or_odd = case (x % 2)
when 1,3,7 # x == 1 || x == 3 || x == 7
  puts "X is Odd"
when 2 # x == 2
  puts "X is even"
when 4 # x == 4
  puts "X is even"
when y == 0
  puts "Sorry"
end

puts "A nicer way to express that is via the case statement."

case x
when 1 # x == 1
  puts "x is odd"
when 3
  puts "x is odd"
when 2
  puts "x is even"  
when 4
  puts "x is odd"
end

puts "The case statement accepts a condition and will compare that condition to each when clause."

puts "You can make that even prettier by using multiple clauses per when branch."

case x
when 1,3
  puts "x is odd"
when 2,4
  puts "x is even"
else
  puts "No idea what x is"
end

puts "It accepts multiple comparisons per when statement, separated by ,."
puts "It also accepts an else clause for if all the comparisons fail."

puts "The case statement uses the when keyword to run comparisons using the equal operator."
puts "Think of it as taking the object of the case, x, and running == against all the whens."
