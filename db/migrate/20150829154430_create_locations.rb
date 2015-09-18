class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :infraction
      t.decimal :lon, precision: 10, scale: 6, null: false
      t.decimal :lat, precision: 10, scale: 6, null: false
      t.timestamps null: false
    end
  end
end
