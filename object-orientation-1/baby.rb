
class Baby
  attr_accessor :first_name, :last_name, :eye_color, :height

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end


  # Class Body
  @@all = []

  def self.all # Class Method
    @@all
  end

  def initialize(name = nil) #hooks, callbacks, life cycle events.
    self.cry
    @@all << self
    @first_name = name.split(" ").first
    @last_name = name.split(" ").last
  end

  def cry # Instance Method
    puts "Waaaaaa#{self}"
  end

end