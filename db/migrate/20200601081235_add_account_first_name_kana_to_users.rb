class AddAccountFirstNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_first_name_kana, :string
  end
end
