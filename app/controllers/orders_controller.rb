class OrdersController < ApplicationController

  def new
    @user = current_user
    @cart_id = Cart.find(params[:cart_id]).id

    @user_cart= []
    CartItem.all.each do |item|
       if item.cart_id == @cart_id
        @user_cart << item
       end
      end
    # Amount in cents
    @amount=0
    @user_cart.each{|i|
      @amount = @amount + i.item.price
    }
  end

  def create
    @cart_id = Cart.find(params[:cart_id]).id
    @user_cart= []
    CartItem.all.each do |item|
       if item.cart_id == @cart_id
        @user_cart << item
       end
      end
    @amount=0
    @user_cart.each{|i|
      @amount = @amount + i.item.price}

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: (@amount*100).to_i,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @order = Order.new(user_id: current_user.id, cart_id: @cart_id)
    @order.save


    @user_cart.each{ |cart_item|
      @order_item = OrderItem.new(item_id: cart_item.item_id, order_id: Order.last.id)
      @order_item.save}

    OrderMailer.confirmation_email(current_user).deliver


    CartItem.where(cart_id: @cart_id).destroy_all

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(@cart_id)
    end
end
