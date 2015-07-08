class Product < ActiveRecord::Base
  has_many :line_items
  has_many :carts, :through => :line_items

  def self.most_popular
    joins(:line_items)
    .select("count(*) AS product_count, products.*")
    .group("line_items.product_id").order("product_count DESC").limit(1)
  end

  def self.bought_this_month
    joins(:carts).where("carts.created_at" => 1.month.ago..DateTime.now)
  end

  def self.starting_with_the_letter(letter)
    where("name LIKE ?", "#{letter}%")
  end

  def self.expensive
    where(:price => 100..1000)
  end

  def self.expensive_products_bought_this_month
    # joins(:carts).
    # where("carts.created_at" => 1.month.ago..DateTime.now).
    # where(:price => 100..1000)
    expensive.bought_this_month
  end
end

class Customer < ActiveRecord::Base
  has_many :carts
  has_many :products, :through => :carts

  def self.who_bought_product(product_name)
    # joins(:line_items => :product)
    joins(:products).where("products.name" => product_name)
  end
    
end
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :products, :through => :line_items

  def total_cost
    # SELECT cart_id, SUM(price) AS total_price FROM products 
    # JOIN line_items ON line_items.product_id = products.id
    # WHERE cart_id = 1

    products.sum(:price)
  end

  # most expensive cart
  def self.most_expensive
    # we need to get the total price of a cart
    # in order to do that, get all the line_items, for each line_item
    # get the product, sum the price, and that's the total, order by total
    select("carts.*, SUM(price) as the_price").
    joins(:products).group("carts.id").
    order("the_price DESC").limit(1)

    # [#<>].customer

    # joins(:line_items)
    # SELECT cart_id, SUM(price) as total_price FROM products 
    # JOIN line_items ON line_items.product_id = products.id


    # SELECT \"products\".* FROM \"products\" 
    # INNER JOIN \"line_items\" ON \"line_items\".\"product_id\" = \"products\".\"id\" 
    # GROUP BY line_items.cart_id
  end  
end
