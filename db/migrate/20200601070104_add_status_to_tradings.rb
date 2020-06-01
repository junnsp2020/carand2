class AddStatusToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :status, :integer
  end
end
