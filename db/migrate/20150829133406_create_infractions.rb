class CreateInfractions < ActiveRecord::Migration
  def change
    create_table :infractions do |t|
      t.string :tweet_id
      t.text :description
      t.belongs_to :location

      t.timestamps null: false
    end
  end
end
