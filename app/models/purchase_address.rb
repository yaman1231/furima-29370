class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number

  with_options presence: true do
    validates :item_id, :user_id, :token, :post_code, :city, :street_number, :phone_number
  end

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid' }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
                   street_number: street_number, building_name: building_name, phone_number: phone_number,
                   purchase_id: purchase.id)
  end
end
