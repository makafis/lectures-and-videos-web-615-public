class Customer < ActiveRecord::Base
  has_many :carts
  has_many :products, :through => :carts

  def self.who_bought_product_by_name(name)
    joins(:carts => :products).where(:products => {:name => name})
  end

  def self.summary
    Customer.includes(:products).all.each do |c|
      puts "Customer #{c.name} bought:"
      c.products.each do |p|
        puts "...#{p.name}"
      end
    end
  end
end

