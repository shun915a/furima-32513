class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      @order_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:token, :zip_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
