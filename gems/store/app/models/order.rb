class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_cart_items(cart)
    cart.cart_items.each do |product|
      product.cart_id = nil
      cart_items << product
    end
  end

  def total_price
    cart_items.to_a.sum { |p| p.total_price }
  end
end
