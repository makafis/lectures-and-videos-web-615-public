# class Dog
# end

# y = Dog.new



class Dog # scope gate
  attr_accessor :name

  def bark
    puts "Woof! #{@name}!!!!"
  end
end

class Person
  attr_accessor :name
end

x = Person.new
x.name = "Avi"
x.bark


y = Dog.new
y.name = "Rover"

z = Dog.new
z.name = "Snoopy"