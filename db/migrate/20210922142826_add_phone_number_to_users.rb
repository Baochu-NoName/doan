class AddPhoneNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string, default:false
  end
end
