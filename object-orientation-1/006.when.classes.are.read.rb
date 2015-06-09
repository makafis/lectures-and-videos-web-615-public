class Baby # Defining a Class
  attr_reader :name

  All = []
  self #=> Baby

  def initialize(name)
    @name = name
    self #> #<Baby:Sdasdjaf43q4q34> The Baby that was just born
    All << self  
    puts "A new baby was born! Mazal Tov!!!"
  end

  def self.all
    All
  end

  def self.find_by_name(name)
    All.find{|baby| baby.name == name}
  end

  def goodbye
    puts "Goodbye World!!!"
  end
end 

baby_one = Baby.new # Instantiating Instances of a Class
baby_two = Baby.new # (which is not reading the class body)
baby_three = Baby.new # So you only see Hello Word!!!!

Baby.count #=> 3






















