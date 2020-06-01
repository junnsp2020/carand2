class AddBankNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bank_name, :string
  end
end
