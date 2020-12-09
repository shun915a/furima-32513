class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページへ
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    # itemの情報を全て取得
    @items = Item.all
  end

  def new
    # itemの新しいインスタンスを作成
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  priveate

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
