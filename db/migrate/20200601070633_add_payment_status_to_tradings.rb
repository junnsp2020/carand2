class AddPaymentStatusToTradings < ActiveRecord::Migration[5.2]
  def change
    add_column :tradings, :payment_status, :integer
  end
end
