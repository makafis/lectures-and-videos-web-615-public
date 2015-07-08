class Customer < ActiveRecord::Base
  has_many :carts
  has_many :products, :through => :carts

  def self.who_bought_product(product_name)
    # joins(:line_items => :product)
    joins(:products).where("products.name" => product_name)
  end
    
end
