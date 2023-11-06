class Item < ApplicationRecord
  validates :title, :info, :tag_id, :condition_id, :invoice_option_id, :prefecture_id, :invoice_day_id, :price, presence: true

  belongs_to :user
end
