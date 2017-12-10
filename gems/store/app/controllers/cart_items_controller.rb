class CartItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @cart_items = current_cart.add_product(@product.id)

    if @cart_items.save
      redirect_to root_path, notice: 'Product was successfully created.'
    else
      redirect_to root_path, notice: 'Error.'
    end
  end

  def destroy
    current_cart.destroy if current_cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_path, notice: 'Cart empty.'
  end
end
