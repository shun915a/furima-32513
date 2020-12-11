class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    order = Order.new(order_params)
    if order.valid?
      pay_item
      order.save
    end
    address = Address.new(address_params(order))
    if address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵を環境変数で設定
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
