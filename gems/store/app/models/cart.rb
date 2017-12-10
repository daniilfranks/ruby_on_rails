class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products

  def add_product(product_id, quantity = 1)
    cart_items = self.cart_items.find_by(product_id: product_id)

    if cart_items
      cart_items.quantity += quantity
    else
      cart_items = self.cart_items.build(product_id: product_id)
    end
    cart_items
  end
end
