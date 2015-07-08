# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
avi = Customer.create(:name => "Avi")
grace = Customer.create(:name => "Grace")

apple_watch = Product.create(:name => "Apple Watch", :price => 350)
iphone = Product.create(:name => "iPhone", :price => 600)
macbook_air = Product.create(:name => "Macbook Air", :price => 1200)

# Let's have Avi buy an apple_watch
avis_cart_1 = avi.carts.create
avis_cart_1.line_items.create(:product => apple_watch)

# Let's have grace buy a macbook_air and an iPhone
graces_cart_1 = grace.carts.create
graces_cart_1.line_items.create(:product => iphone)
graces_cart_1.line_items.create(:product => macbook_air)

# Let's have Avi buy a Macbook Air in a seperate purchase
avis_cart_2 = avi.carts.create
avis_cart_2.line_items.create(:product => macbook_air)

