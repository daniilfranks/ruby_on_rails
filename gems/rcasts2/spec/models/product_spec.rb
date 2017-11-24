require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @cart = create(:cart)
    @product = create(:product)
  end

  it 'has many products through cart_products' do
    @cart.products << @product

    expect(@cart.products).to include(@product)
  end
end
