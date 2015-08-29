class AddUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer, references: "users"
  end
end
