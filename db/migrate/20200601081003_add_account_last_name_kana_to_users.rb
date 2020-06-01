class AddAccountLastNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_last_name_kana, :string
  end
end
