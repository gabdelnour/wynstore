class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
    @cart_items = @cart.cart_items
    @user = @cart.user
  end
end