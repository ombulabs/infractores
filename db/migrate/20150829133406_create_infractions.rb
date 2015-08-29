class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.belongs_to :tweet
      t.text :description
      t.belongs_to :location

      t.timestamps null: false
    end
  end
end
