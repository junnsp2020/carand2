class AddNameToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :name, :string
  end
end
