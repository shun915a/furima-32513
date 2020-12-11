class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページへ
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_item, only: %i[show edit update]

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

  def show
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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
