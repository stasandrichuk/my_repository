class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_filter :extract_shopping_cart
  
  def show
    # binding.pry   
  end

  def add
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    # render json: current_user.cart_count, status: 200
    redirect_to shopping_cart_path
  end

  def remove
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product, 1)
    # render json: current_user.cart_count, status: 200
    redirect_to shopping_cart_path
  end

  private
  def extract_shopping_cart
    @shopping_cart = current_user.shopping_cart
    @cart_items = ShoppingCartItem.where(:owner_id => @shopping_cart.id)
    @products = Array.new

    @cart_items.each_with_index { |cart_item, index|
      product_item = Hash.new
      tmp_product = Product.find(cart_item.item_id)
      product_item['obj'] = tmp_product
      product_item['quantity'] = cart_item.quantity
      product_item['cart_action'] = tmp_product.cart_action tmp_product.id
      @products << product_item
    }
  end

end
