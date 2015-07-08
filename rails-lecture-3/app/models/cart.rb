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
