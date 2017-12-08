30.times do |n|
Product.create!(title: Faker::Commerce.unique.product_name,
                description: 'Description of goods',
                price: Faker::Commerce.price,
                image_url: Faker::Avatar.image)
end