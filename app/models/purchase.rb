class Purchase < ApplicationRecord
  validates :user, :item, presence: true

  belongs_to :user
  belongs_to :item

end
