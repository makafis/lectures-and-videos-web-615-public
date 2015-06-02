'This is data, it is a string. Strings start with " "'

"Part of being data, or a string, is that ruby doesn't interpet it."

puts 1+1
puts "1+1"

example = "The word 'example' is equal to this sentence, it's a named variable."

puts example
puts example
puts example

square_x = 16

puts "variables are any previously undefined word that"
puts "starts with a lower case variable."

puts "So what's with this puts word?"

puts "It's a method! Methods are instructions and logic you define."
puts "In short, they do things. The puts method prints to screen."

puts "So you see this string"

"But not this string."


def countup
  [1,2,3,4,5,6,7,8,9,10,11,12].each do |i|
    puts i
  end
end

puts "Once a method is defined using the def keyword, you can execute that method."
puts "You execute it by simply calling its name."

countup

puts "Basically, any word that isn't a ruby keyword must either be a variable or a method."


# Assignment

# make a variable called name and make it equal to your name.
# print that variable to screen using puts.
# define a method that say_hello that says hello via puts "hello"

