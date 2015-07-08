class Product < ActiveRecord::Base
  has_many :line_items
  has_many :carts, :through => :line_items
  has_many :customers, :through => :carts

  def self.most_popular
    # SELECT products.name, COUNT(*) AS total FROM products 
    # INNER JOIN line_items ON line_items.product_id = products.id
    # GROUP BY product_id

    # joins(:line_items).group(:product_id).count(:product_id).max

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
