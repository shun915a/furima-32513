require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品成功' do
      it '
      image
      name
      info
      price
      category_id
      sales_status_id
      shipping_fee_status_id
      prefecture_id
      item_scheduled_delivery_id
      があれば出品できる' do
        expect(@item).to be_valid
      end

      context '出品失敗' do
        it 'imageがなければ出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameがなければ出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'infoがなければ出品できない' do
          @item.info = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end

        it 'priceがなければ出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが300未満だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price out of setting range or not integer')
        end

        it 'priceが9,999,999より大きいと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price out of setting range or not integer')
        end

        it 'priceが全角数字だと出品できない' do
          @item.price = '１００００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price out of setting range or not integer')
        end

        it 'category_idが0だと出品できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 0')
        end

        it 'sales_status_idが0だと出品できない' do
          @item.sales_status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Sales status must be other than 0')
        end

        it 'shipping_fee_status_idが0だと出品できない' do
          @item.shipping_fee_status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee status must be other than 0')
        end

        it 'prefecture_idが0だと出品できない' do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
        end

        it 'item_scheduled_delivery_idが0だと出品できない' do
          @item.item_scheduled_delivery_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Item scheduled delivery must be other than 0')
        end
      end
    end
  end
end
