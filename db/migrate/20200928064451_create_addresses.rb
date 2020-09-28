class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,          null: false, foreign_key: true
      t.string     :post_code,         default: "",  null: false
      t.integer    :prefecture,        null: false,  null: false
      t.string     :city,              default: "",  null: false
      t.string     :street_number,     default: "",  null: false
      t.string     :building_name,     default: ""
      t.string     :phone_number,      default: "",  null: false
      t.timestamps
    end
  end
end
