class ProductsController < ApplicationController
  def index
  end
  
  def add
    session[:cart] ||= []
    session[:cart] << Product.first
    redirect_to products_path
  end

  def destroy
    session[:cart] = nil
    redirect_to products_path
  end
end
