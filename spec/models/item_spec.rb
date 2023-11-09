require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '商品出品ができるとき' do
    it 'title, info, tag_id, condition_id, invoice_option_id, prefecture_id, invoice_day_id, priceが存在すれば出品できる' do
      expect(@item).to be_valid
    end
    end
  context '商品出品ができないとき' do
    it 'titleが空では登録できない' do
    end
    it 'infoが空では登録できない' do
    end
    it 'condition_idが'
  end
  end
end