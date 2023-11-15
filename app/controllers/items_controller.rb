class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @purchase = @item.purchase
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
      return
    end
    item.destroy
    redirect_to root_path
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @orders.present?
  end

  def update
    item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :info, :price, :image, :condition_id, :invoice_option_id, :prefecture_id,
                                 :invoice_day_id, :tag_id).merge(user_id: current_user.id)
  end
end
