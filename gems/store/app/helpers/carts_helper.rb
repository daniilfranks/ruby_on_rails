module CartsHelper
  def current_cart
    if cart_id = session[:cart_id]
      @cart ||= Cart.find_by(id: cart_id)
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end