class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,            null: false, foreign_key: true
      t.string :name,                null: false, default: ""
      t.text :description,           null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :postage_payer_id,   null: false
      t.integer :prefecture_id,      null: false
      t.integer :handling_time_id,   null: false
      t.string :price,              null: false

      t.timestamps null: false
    end
  end
end
