class Item < ApplicationRecord
  validates :title, :info, :price, presence: true
  validates :tag_id, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, numericality: { other_than: 1 ,message: "can't be blank"}

  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :invoice_option
  belongs_to :prefecture
  belongs_to :invoice_day
end
