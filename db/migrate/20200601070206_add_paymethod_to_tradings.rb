class AddPaymethodToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :paymethod, :integer
  end
end
