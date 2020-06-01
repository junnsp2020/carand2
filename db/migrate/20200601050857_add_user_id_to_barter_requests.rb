class AddUserIdToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :user_id, :integer
  end
end
