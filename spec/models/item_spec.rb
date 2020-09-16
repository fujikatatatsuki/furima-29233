require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品が成功する場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
        expect(@item).to be_valid
      end
      it '画像(image)が登録されていれば登録できる' do
        @item.image
        expect(@item).to be_valid
      end
      it '商品名(name)が入力されていれば登録できる' do
        @item.name
        expect(@item).to be_valid
      end
      it 'カテゴリー(category_id)の情報が入力がされていれば登録できる' do
        @item.image
        expect(@item).to be_valid
        binding.pry
      end
      it '商品の状態(status_id)についての情報が入力されていれば登録できる' do
      end
      it '配送料(delivery_fee_id)の負担についての情報が入力されていれば登録できる' do
      end
      it '発送元の地域(shipping_region_id)についての情報が入力されていれば登録できる' do
      end
      it '発送までの日数(shipping_day_id)についての情報が入力されていれば登録できる' do
      end
      it '販売価格(selling_price)についての情報が入力されていれば登録できる' do
      end
      it '販売価格(selling_price)の範囲が、¥300~¥9,999,999の間であれば登録できる' do
      end
      it '販売価格(selling_price)は半角数字のみで入力されていれば登録できる' do
      end
    end

    context '商品出品が失敗する場合' do
      it '画像が登録されていなければ登録できない' do
      end
      it '商品名が入力されていなければ登録できない' do
      end
      it 'カテゴリーの情報が入力がされていなければ登録できない' do
      end
      it '商品の状態についての情報が入力がされていなければ登録できない' do
      end
      it '配送料の負担についての情報が入力がされていなければ登録できない' do
      end
      it '発送元の地域についての情報が入力がされていなければ登録できない' do
      end
      it '発送までの日数についての情報が入力がされていなければ登録できない' do
      end
      it '価格についての情報が入力がされていなければ登録できない' do
      end
      it '価格の範囲が、¥300~¥9,999,999の間でなければ登録できない' do
      end
      it '販売価格は半角数字のみで入力がされていなければ登録できない' do
      end
    end
  end
end
