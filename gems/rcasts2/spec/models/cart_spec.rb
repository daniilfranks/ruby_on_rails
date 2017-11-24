require 'rails_helper'

RSpec.describe Cart, type: :model do
  before do
    @cart = create(:cart)
    @product = create(:product)
  end

  it 'has many carts through cart_products' do
    @product.carts << @cart

    expect(@product.carts).to include(@cart)
  end
end
