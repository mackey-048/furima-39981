class Item < ApplicationRecord
  validates :image, :title, :info, :price, presence: true
  validates :tag_id, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validate :price_within_range

  def price_within_range
    unless price.between?(300, 9_999_999)
      errors.add(:price, "は¥300から¥9,999,999の間の半角数字で指定してください")
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :invoice_option
  belongs_to :prefecture
  belongs_to :invoice_day
end
