class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :location
  belongs_to :status
  belongs_to :delivery_date


  validates :name, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :location_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_date_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :discription, presence: true
  validates :price, presence: true
  validates :user, presence: true



end
