class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :post_num, :region_id, :city, :address, :building, :phone, :purchase, :user_id, :item_id 

  with_options presence: ture do 
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :phone, length: { minimum: 10, maximum: 11 }, numericality: format: {with: /\A[0-9]\/z, message: "can't be blank"}
    validates :address, :city
    validates :user_id, :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_num: post_num, region_id: region_id, phone: phone, city: city, address: address, building: building, user_id: user_id)
  end
end
