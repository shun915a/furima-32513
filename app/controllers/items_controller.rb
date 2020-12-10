class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページへ
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info,
      :price,
      :category_id,
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :item_scheduled_delivery_id
    ).merge(user_id: current_user.id)
  end
end
