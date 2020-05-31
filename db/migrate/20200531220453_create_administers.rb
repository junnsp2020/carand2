class CreateAdministers < ActiveRecord::Migration[5.2]
  def change
    create_table :administers do |t|

      t.timestamps
    end
  end
end
