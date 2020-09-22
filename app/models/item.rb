class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time
  has_one_attached :image

  validates :name, :description, :category, 
  :condition, :postage_payer, :prefecture, 
  :handling_time, :price, presence: true

  validates :category_id, :condition_id, :postage_payer_id,
  :prefecture_id, :handling_time_id, numericality: { other_than: 1 }

end
