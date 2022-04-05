class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :municipalities, :user_id, :location_id, :address, :building, :tel_number, :item_id, :token

  with_options presence: true do
    validates :municipalities
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :address
    validates :tel_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :location_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: @user_id)
    Address.create(post_code: post_code, municipalities: municipalities, location_id: location_id, address: address,
                   building: building, tel_number: tel_number, order_id: order.id)
  end
end
