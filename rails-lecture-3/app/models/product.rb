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
