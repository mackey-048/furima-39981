class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

    private
  def prototype_params
    params.require(:item).permit(:title, :info, :price, :image, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, ).merge(user_id: current_user.id)
  end
end
