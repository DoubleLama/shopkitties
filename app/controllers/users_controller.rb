class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
  end

  def create
  end

  def index
  end

  def show
    @user = current_user
    @cart_id=@user.cart_id

    @orders=[]
    Order.all.each{|order|
      if order.cart_id == @cart_id
        @orders << order
      else end}

    @order_items= []
    OrderItem.all.each do |order_item|
       if order_item.order.cart_id == @cart_id
        @order_items << order_item
       end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path,
      notice: "Votre profil a été mis à jour"
    else
      render :new,
      notice: "Il y a une erreur, recommence"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params

    params.require(:user).permit(:first_name, :last_name, :description)

  end

end
