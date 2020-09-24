require 'rails_helper'
describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入が成功する場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入が失敗する場合' do
      it 'クレジットカード情報(token)が入力されていないと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号(postal_code)が入力されていないと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code input correctly')
      end
      it '郵便番号は(postal_code)、-が使用されていないと購入できない' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code input correctly')
      end
      it '都道府県(hipping_region_id)の値が１（---）だと購入できない' do
        @order_address.shipping_region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Shipping region must be other than 1')
      end
      it '市区町村(city)が入力されていないと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地(block_number)が入力されていないと購入できない' do
        @order_address.block_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号(phone_number)が入力されていないと購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号(phone_number)に、-が入力されていたら購入できない' do
        @order_address.phone_number = '080-0120-1171'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号(phone_number)が、11桁以上で入力されていたら購入できない' do
        @order_address.phone_number = 0o00000000012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
