require 'rails_helper'

RSpec.describe Cart, type: :model do
  let!(:cart) { create(:cart) }
  let!(:product) { create(:product) }

  it 'has many carts through cart_products' do
    product.carts << cart

    expect(product.carts).to include(cart)
  end
end
