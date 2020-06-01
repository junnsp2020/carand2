class AddUserIdToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :user_id, :integer
  end
end
