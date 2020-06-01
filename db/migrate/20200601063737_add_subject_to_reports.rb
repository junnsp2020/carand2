class AddSubjectToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :subject, :integer
  end
end
