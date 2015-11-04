class ChangeInfractionLatLong < ActiveRecord::Migration
  def change
    change_column :infractions, :lat, :decimal, precision: 10, scale: 6, null: true
    change_column :infractions, :lon, :decimal, precision: 10, scale: 6, null: true
  end
end
