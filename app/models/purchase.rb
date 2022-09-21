class Purchase < ApplicationRecord
  belongs_to :user
  has_one :destination
  belong_to :item
end