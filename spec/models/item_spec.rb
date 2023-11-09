require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'image, title, info, tag_id, condition_id, invoice_option_id, prefecture_id, invoice_day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'infoが空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'tag_idが空では出品できない' do
        @item.tag_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Tag can't be blank")
      end

      it 'tag_idが1では出品できない' do
        @item.tag_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Tag can't be blank")
      end
      
      it 'condition_idが空では出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_idが1では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'invoice_option_idが空では出品できない' do
        @item.invoice_option_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice option can't be blank")
      end

      it 'invoice_option_idが1では出品できない' do
        @item.invoice_option_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice option can't be blank")
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'invoice_day_idが空では出品できない' do
        @item.invoice_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice day can't be blank")
      end

      it 'invoice_day_idが1では出品できない' do
        @item.invoice_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字の¥300から¥9,999,999の範囲内で指定してください")
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字の¥300から¥9,999,999の範囲内で指定してください")
      end

      it 'priceが数字ではなく文字であれば登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字の¥300から¥9,999,999の範囲内で指定してください")
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字の¥300から¥9,999,999の範囲内で指定してください")
      end
      it 'userが紐付いてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end