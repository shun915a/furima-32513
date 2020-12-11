class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    order = Order.create(order_params(@item))
    address = Address.new(address_params(order))
    if address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params(item)
    params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: item.id)
  end

  def address_params(order)
    params.permit(
      :zip_code,
      :prefecture_id,
      :city,
      :street,
      :building,
      :phone_number
    ).merge(order_id: order.id)
  end
end
