# Another way to use expressions to control flow is through loops. 
# Ruby uses the while keyword to repeat a block of code on a condition being 
# true.
x = 1

while x < 10 # Since x is 1, this block of code will run.
  puts x
  
  if x < 4 # Nothing prevents you from having more logic in a loop.
    puts "it is still less then 4"
  end
end

# After the first iteration (loop) of that code, x will be 3, so the code block
# will run again. During the 3rd iteration, x will become 5, and so forth
# and so forth.

# I love the way Bret Victor visualizes the flow of code through a loop:
# https://s3.amazonaws.com/worrydream.com/LearnableProgramming/Movies/Flow9.mp4
# Read the entire article: http://worrydream.com/LearnableProgramming/

# The break keyword will exit the current loop.
while true
  puts "This will run exactly once"
  break
end

# Some Fun Loops
# WARNING: Some of these loops can become infinite loops.
hell = "really hot"
until hell == "frozen over"
  hell = "frozen over"
  puts "Don't use the until loop, it doesn't read as nicely as while"
end

# If you're curious, there is a slightly lower level iterator (iterator is a 
# word we use to describe methods that create loops), the loop keyword. It
# simply starts a loop, independent of any condition, and loops forever, until
# it encounters a break keyword.

# loops, unlike while, begin with the do keyword.
x = 0
loop do
  puts "This loop will run 3 times"
  x += 1
  break if x >= 3
end

# Funny, that loop looks like it's accomplishing the same thing as a while loop.
x = 0
while x <= 3
  puts "This loop will run 3 times"
  x += 1
end