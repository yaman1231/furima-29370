class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :purchase

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time
  has_one_attached :image


  validates :name, :description, :category, 
  :condition, :postage_payer, :prefecture, 
  :handling_time, :price, :image, presence: true

  validates :category_id, :condition_id, :postage_payer_id,
  :prefecture_id, :handling_time_id, numericality: { other_than: 1 }

  validates :price, numericality: {
  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, 
  message: "300円以上9999999円以下で入力して下さい"}

  validates :price, format: {
    with: /\A[0-9]+\z/,
    message: '半角数字のみで入力して下さい'}
end