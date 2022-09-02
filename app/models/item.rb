class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :arrival
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  has_one_attached :image

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
  end
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :area_id, presence: true
  validates :arrival_id, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true

  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :arrival_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}

  def was_attached?
    self.image.attached?
  end 
end
