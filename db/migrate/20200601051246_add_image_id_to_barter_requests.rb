class AddImageIdToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :image_id, :string
  end
end
