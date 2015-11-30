class AddReportedAtToInfractions < ActiveRecord::Migration
  def change
    add_column :infractions, :reported_at, :datetime
  end
end
