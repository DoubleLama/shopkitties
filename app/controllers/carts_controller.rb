class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]


  def create
    @cart = Cart.create
  end

  def show

    @cart_id = current_user.cart_id

    @user_cart= []
    CartItem.all.each do |item|
       if item.cart_id == @cart_id
        @user_cart << item
       end
      end

    @amount=0
    @user_cart.each{|i|
      @amount = @amount + i.item.price
      }
  end

  def update
  end

  def edit
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

end
