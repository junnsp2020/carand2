class AddShipmentStatusToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :shipment_status, :integer
  end
end
