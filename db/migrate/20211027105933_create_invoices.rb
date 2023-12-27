class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :status
      t.decimal :total, precision: 6, scale: 2
      t.string :username
      t.string :phone_number
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
