class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name,       default: ""
      t.text :description,  default: ""
      t.decimal :price,     default: 0.0, precision:6, scale: 2
      t.boolean :available, default: true
      t.boolean :featured,  default: false
      t.decimal :new_price, default: 0.0, precision:6,scale: 2
      t.datetime :released_at
      t.integer :sold_quantity
      t.decimal :rating
      t.timestamps
    end
  end
end
