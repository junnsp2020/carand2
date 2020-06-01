class AddBranchCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :branch_code, :string
  end
end
