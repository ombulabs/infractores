class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_user_id
      t.string :username
      t.string :profile_image_url
      t.string :name

      t.timestamps null: false
    end
  end
end
