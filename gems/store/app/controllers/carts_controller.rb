class CartsController < ApplicationController
  def index
  end

  def create
    @product = Product.find(params[:product_id])
    @cart_items = current_cart.add_product(@product.id)

    if @cart_items.save
      redirect_to cart_path, notice: 'Product was successfully created.'
    else
      redirect_to cart_path, notice: 'Error.'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @cart_items = current_cart.delete_product(@product.id)

    if @cart_items.save
      redirect_to cart_path, notice: 'Product was successfully delete.'
    else
      redirect_to cart_path, notice: 'Error.'
    end
  end
end
