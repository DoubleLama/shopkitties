class CartItemsController < ApplicationController

  def create
    @user = current_user
    @cart_id = @user.cart_id
    @cartitem = CartItem.new(cart_id: @cart_id, item_id: params[:item_id])
    if @cartitem.save
      redirect_to items_path
    else end
  end

  def index
  end

  def show

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
