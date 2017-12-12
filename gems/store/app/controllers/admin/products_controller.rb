class Admin::ProductsController < Admin::ApplicationController
  def index
    @product = Benchmark.ms { Product.all }
    @order = Benchmark.ms { Order.all }
    @cart_items = Benchmark.ms { CartItem.all }
    @cart = Benchmark.ms { Cart.all }
  end
end
