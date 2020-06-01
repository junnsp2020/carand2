class AddIntroductionToBarterRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :barter_requests, :introduction, :text
  end
end
