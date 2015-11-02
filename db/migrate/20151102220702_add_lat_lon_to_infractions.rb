class AddLatLonToInfractions < ActiveRecord::Migration
  def change
    add_column :infractions, :lat, :decimal, precision: 10, scale: 6, null: false
    add_column :infractions, :lon, :decimal, precision: 10, scale: 6, null: false
  end
end
