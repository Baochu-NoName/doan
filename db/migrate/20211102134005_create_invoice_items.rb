class CreateInvoiceItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_items do |t|
      t.string :product_image
      t.integer :product_id
      t.string :product_name
      t.decimal :product_unit_price, precision: 6, scale: 2
      t.integer :product_quantity
      t.timestamps
    end
  end
end
