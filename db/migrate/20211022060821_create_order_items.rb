class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :total, precision: 6, scale: 2
      t.decimal :unit_price, precision: 6, scale: 2
      
      t.references :product, null: false, foreign_key: true
      t.references :order, foreign_key: true
      t.belongs_to :invoice     
      t.timestamps
    end
  end
end
