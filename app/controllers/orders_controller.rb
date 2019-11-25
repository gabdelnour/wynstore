class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
    end

    def new 
        @cart = Cart.find(params[:cart_id])
        @cart_items = @cart.cart_items
        @total = @cart.items.reduce(0) { |acc, item| acc + item.price.round(2) }
        @total = @total.round(2)
        @order = Order.new
    end 

    def create 
        @cart = Cart.find(params[:cart_id])
        order = Order.new(order_params)
        total = @cart.items.reduce(0) { |acc, item| acc + item.price.round(2) }
        total = total.round(2)
        cart = Cart.find(params[:cart_id])
        order.user = current_user
        order.cart = cart
        order.total = total
        Cart.create(user: current_user)
        stripe_total = (order.total * 100).round(2).to_i 

    customer = Stripe::Customer.create(
        :email => 'some@guy.com',
        :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer => customer.id,
        :amount => stripe_total,
        :description => 'description',
        :currency => 'usd'
    )

    redirect_to root_path if order.save
    
    rescue Stripe::CardError => e
        flash[:error] = e.message 
        redirect_to charges_path
    end 

    private 
    def order_params 
        params.require(:order).permit(:shipping_info_id)
    end 
end
