class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :arrival
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  has_one_attached :image

  validates :area_id, numericality: { other_than: 1}
  validates :arrival_id, numericality: { other_than: 1}
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :category_id, numericality: { other_than: 1}
end
