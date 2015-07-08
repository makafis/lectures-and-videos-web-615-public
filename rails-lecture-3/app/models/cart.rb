class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items

  def total_cost
    products.sum(:price)
  end

  def self.summary
    joins(:products).group(:cart_id).sum(:price)
  end

  def self.most_expensive
    # we need to get the total price of a cart
    # in order to do that, get all the line_items, for each line_item
    # get the product, sum the price, and that's the total, order by total
    select("carts.*, SUM(price) as the_price").
    joins(:products).group("carts.id").
    order("the_price DESC").limit(1)
  end  

end
