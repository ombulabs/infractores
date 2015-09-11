class AddValidColumnToInfractions < ActiveRecord::Migration
  def change
    add_column :infractions, :legitimate, :boolean, default: true
    add_column :users, :infractions_count, :integer, default: 0
  end
end
