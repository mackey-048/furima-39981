class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

    private
  def item_params
    params.require(:item).permit(:title, :info, :price, :image, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, :tag_id).merge(user_id: current_user.id)
  end
end
