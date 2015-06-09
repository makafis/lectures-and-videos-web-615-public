# constants are variables that begin with a capital letter
# the convention is to write constant names in FULLCAPS
CONST = "test"

# a constant is intended to be just that: constant.
# the Ruby interpreter will issue a warning if you reassign
# a constant, but it will not stop you
CONST = "nope"

# constants within a class are accessed within the class by names
class MyClass
  MYCONST = "hi"

  def self.show_constant
    MYCONST
  end
end

# and accessed from outside the class with the scope operator

MyClass::MYCONST

# constants can be added to a class with the scope operator

MyClass::NEWCONSTANT = "new"
MyClass::NEWCONSTANT

# constants may not be defined inside of methods

def my_method
  MYCONSTANT = 123
end
# SyntaxError: (irb):20: dynamic constant assignment