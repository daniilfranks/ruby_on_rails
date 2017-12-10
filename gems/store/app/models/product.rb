class Product < ApplicationRecord
  has_many :cart_items
  has_many :carts

  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
