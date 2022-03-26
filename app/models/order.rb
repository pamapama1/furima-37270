class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

belongs_to :user
belongs_to :item
has_one :address

end
