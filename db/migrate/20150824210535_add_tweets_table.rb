class AddTweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets, id: false do |t|
      t.string :id, unique: true, null: false
      t.text :json, null: false
    end
  end
end
