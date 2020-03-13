class CatPicturesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.cat_picture.attach(params[:cat_picture])
    redirect_to(item_path(@item))
  end
end
