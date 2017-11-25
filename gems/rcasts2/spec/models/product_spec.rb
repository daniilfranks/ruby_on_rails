require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:cart) { create(:cart) }
  let!(:product) { create(:product) }

  it 'has many products through cart_products' do
    cart.products << product

    expect(cart.products).to include(product)
  end
end
