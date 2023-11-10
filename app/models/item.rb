class Item < ApplicationRecord
  validates :image, :title, :info, presence: true
  validates :tag_id, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, numericality: { other_than: 1 ,message: "can't be blank"}

  validates :price, presence: true, 
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は半角数字の¥300から¥9,999,999の範囲内で指定してください" }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :invoice_option
  belongs_to :prefecture
  belongs_to :invoice_day
end
