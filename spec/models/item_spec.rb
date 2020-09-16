require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品が成功する場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する場合' do
      it '画像(image)が登録されていなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名(name)が入力されていなければ登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリー(category_id)の情報が入力がされていなければ登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態(status_id)についての情報が入力がされていなければ登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料の負担(delivery_fee_id)についての情報が入力がされていなければ登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee is not a number')
      end
      it '発送元の地域(shipping_region_id)についての情報が入力がされていなければ登録できない' do
        @item.shipping_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping region is not a number')
      end
      it '発送までの日数(shipping_day_id)についての情報が入力がされていなければ登録できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a number')
      end
      it '販売価格(selling_price)についての情報が入力がされていなければ登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price is not a number', 'Selling price is invalid')
      end
      it '販売価格(selling_price)の範囲が、¥300以下であれば登録できない' do
        @item.selling_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '販売価格(selling_price)の範囲が、¥9,999,999以上であれば登録できない' do
        @item.selling_price = 1, 0o00, 0o00, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price is not a number', 'Selling price is invalid')
      end
      it '販売価格(selling_price)は半角数字以外で入力されていれば登録できない' do
        @item.selling_price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end
