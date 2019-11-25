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
        order = Order.new(order_params)
        cart = Cart.find_by(paid: false, id: params[:cart_id])
        return redirect_to cart_path(params[:cart_id]) unless cart
        order.user = current_user
        order.cart = cart
        order.total = cart.total_price
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

    
        if order.save
            Cart.create(user: current_user)
            cart.update(paid: true)
            redirect_to root_path 
        end
    rescue Stripe::CardError => e
        flash[:error] = e.message 
        redirect_to charges_path
    end 

    private 
    def order_params 
        params.require(:order).permit(:shipping_info_id)
    end 
end
