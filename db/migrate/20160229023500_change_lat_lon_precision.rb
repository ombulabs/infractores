class ChangeLatLonPrecision < ActiveRecord::Migration
  def change
    change_column :infractions, :lat, :decimal, precision: 12, scale: 10, null: false
    change_column :infractions, :lon, :decimal, precision: 12, scale: 10, null: false
  end
end
