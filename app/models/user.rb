class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

  validates :last_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: '全角で入力して下さい'
  }, presence: true

  validates :first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: '全角で入力して下さい'
  }, presence: true

  validates :last_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: '全角カタカナのみで入力して下さい'
  }, presence: true

  validates :first_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: '全角カタカナのみで入力して下さい'
  }, presence: true

  validates :birth_date, presence: true
end
