class CreateCommendations < ActiveRecord::Migration
  def change
    create_table :commendations do |t|
      t.string :mail
      t.string :product_id
      t.string :product_title
      t.float :product_price
      t.string :product_img
      t.text :product_description
      t.string :url
      t.string :customer
      t.integer :customer_id
      t.text :comment
      t.integer :shop_id

      t.timestamps null: false
    end
    add_index :commendations, :customer_id
    add_index :commendations, :shop_id
    add_index :commendations, :product_id
    add_index :commendations, [:product_id,:shop_id]
    add_index :commendations, [:customer_id,:shop_id]
  end
end
