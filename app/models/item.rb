class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :location
  belongs_to :status
  belongs_to :delivery_date
  has_one_attached :image

  validates :image, presence: true

  validates :name, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :location_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_date_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :description, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  # validates :user_id, presence: true

  belongs_to :user
end
