class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total
      t.decimal :tax

      t.timestamps
    end
  end
end
