require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '購入情報の保存' do
    before do
      @order_item = FactoryBot.build(:order_item)
    end

    context '購入情報保存が成功' do
      it 'すべての値が入力されていれば保存できる' do
        expect(@order_item).to be_valid
      end

      it 'building が空欄でも保存できる' do
        @order_item.building = ''
        expect(@order_item).to be_valid
      end
    end

    context '購入情報保存が失敗' do
      it 'user がなければ保存できない' do
        @order_item.user = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("User can't be blank")
      end

      it 'item がなければ保存できない' do
        @order_item.item = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Item can't be blank")
      end

      it 'token がなければ保存できない' do
        @order_item.token = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip code がなければ保存できない' do
        @order_item.zip_code = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip code のハイフンがない場合保存できない' do
        @order_item.zip_code = '1234567'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Zip code input correctly')
      end

      it 'zip code が数字でなければ保存できない' do
        @order_item.zip_code = 'abc-defg'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Zip code input correctly')
      end

      it 'prefecture id がない場合は保存できない' do
        @order_item.prefecture_id = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture を選択していない場合は保存できない' do
        @order_item.prefecture_id = 0
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'city がなければ保存できない' do
        @order_item.city = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("City can't be blank")
      end

      it 'street がなければ保存できない' do
        @order_item.street = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Street can't be blank")
      end

      it 'phone number がなければ保存できない' do
        @order_item.phone_number = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone number が数字でなければ登録できない' do
        @order_item.phone_number = 'abcdefg'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Phone number input only number')
      end
      it 'phone number が12桁以上だと登録できない' do
        @order_item.phone_number = '123456789012'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
