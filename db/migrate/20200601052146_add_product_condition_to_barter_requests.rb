class AddProductConditionToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :product_condition, :integer
  end
end
