# http://www.techotopia.com/index.php/Ruby_Variable_Scope

# Local Variables
# start with lowercase letters
local = "test"

def is_local?
  puts "local" if defined?(local)
end

is_local?

# Constants
# start with uppercase letters

# Constants declared within a class or module are available anywhere
# within the context of that class or module.
# Constants declared outside of a class or module are assigned
# global scope.

Constant = "should not be changed"
ALSO_USED = "should not be changed"

def is_constant?
  puts "constant" if defined?(Constant)
end

is_constant?

Constant = "changed value"

class ConstantScope
  Value = true
end

puts "Not Correctly Scoped" if defined?(Value)
puts "Correctly Scoped" if defined?(ConstantScope::Value) # is :: Scope or Namespace

# Global Variables
# A global variable has a name beginning with $. It can be referred to from anywhere in a program.
# Before initialization, a global variable has the special value nil.
puts $DONTUSE
$DONTUSE = "these ever. seriously, you're polluting the world"

# ruby has a few of these built in, that's what they are for.
puts $0 # is the global variable for the file currently being run.

# Instance Variables
class Dog
  @@class_variable
  name = "test"

  def color
    @color
  end

  def color=(string)
    @color = string
  end
end

# Class Variables
# Just don't use them, but for fun.
