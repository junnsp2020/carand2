class AddProductIdToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :product_id, :integer
  end
end
