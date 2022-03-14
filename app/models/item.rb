class Item < ApplicationRecord
  validates :name, presence: true
  validates :integer, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :location_id, presence: true
  validates :delivery_date_id, presence: true
  validates :discription, presence: true
  validates :price, presence: true
  validates :user, presence: true

end
