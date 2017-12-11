rails g scaffold product title:string description:string image_url:string price:decimal --no-test-framework
t.decimal :price, precision: 8, scale: 2

rails g migration add_index_to_products_title
add_index :products, :title, unique: true

rails g scaffold cart --no-test-framework
rails g scaffold CartItems cart:references product:references quantity:integer --no-test-framework
t.integer :quantity, default: 1

rails g scaffold order email:string address:text --no-test-framework
rails g migration add_order_to_cart_items order:references

rails db:migrate && rails db:migrate RAILS_ENV=test

rails db:migrate:reset && rails db:seed

# Test console
cart = Cart.create

product1 = Product.create(title: 'Book1', description: 'text', price: 4.99, image_url: 'book1.png')
product2 = Product.create(title: 'Book2', description: 'text', price: 9.99, image_url: 'book2.png')
product3 = Product.create(title: 'Book3', description: 'text', price: 5.99, image_url: 'book3.png')

cart.cart_items.build(product_id: product2.id, quantity: 3)
cart.cart_items