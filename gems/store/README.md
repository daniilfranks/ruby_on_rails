rails g scaffold product title:string description:string image_url:string price:decimal --no-test-framework

rails g migration add_index_to_products_title
add_index :products, :title, unique: true

t.decimal :price, precision: 8, scale: 2

rails db:migrate && rails db:migrate RAILS_ENV=test

rails db:migrate:reset && rails db:seed

