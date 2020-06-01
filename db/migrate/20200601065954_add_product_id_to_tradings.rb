class AddProductIdToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :product_id, :integer
  end
end
