class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :post_num, :region_id, :city, :address, :building, :phone, :purchase, :user, :item 

  with_options presence: ture do 
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :phone, length: { minimum: 10, maximum: 11 }, numericality: format: {with: /\A[0-9]\/z, message: "can't be blank"}
    validates :address, :city
    validates :user_id
  end

  end
