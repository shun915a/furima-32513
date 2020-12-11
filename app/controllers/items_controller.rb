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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user == @item.user
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
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
