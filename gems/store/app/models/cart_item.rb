class CartItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :cart
  belongs_to :product

  def total_price
    product.price * quantity
  end
end
