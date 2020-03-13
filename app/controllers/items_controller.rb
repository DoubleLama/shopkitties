class ItemsController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
      if @user.cart_id == nil
        Cart.create()
        @user.update(cart_id: Cart.last.id)
      else end
    else end
      if search 
    else end 
end

  def show
    @item = Item.find(params[:id])
  end

  def search
    @parameter = params[:search]
    @results = Item.all.where("lower(title) LIKE :search", search: @parameter)
  end 
  
end
