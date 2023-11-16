require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_order.building = nil
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空では保存できない' do
        @purchase_order.postcode = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_order.postcode = '1234567'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0では保存できない' do
        @purchase_order.prefecture_id = 0
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_order.city = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では登録できない' do
        @purchase_order.block = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上11桁以上の整数でないと保存できない' do
        @purchase_order.phone_number = '123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number must be greater than or equal to 1000000000")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
      end

    end
  end
