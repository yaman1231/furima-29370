class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  # 空の投稿を保存できないようにする
  validates :title, :text, :genre, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 1 }
end
