class User < ActiveRecord::Base
  has_many :tweets

  # It uses a {Twitter::Tweet} to find and update an existing {User} or create
  # a new one
  #
  # @param tuit [Twitter::Tweet]
  # @return [User]
  def self.find_or_create!(tuit)
    usr = tuit.user

    result = User.find_or_create_by!(twitter_user_id: usr.id)
    result.update_attributes!(username: usr.screen_name,
                              profile_image_url: usr.profile_image_url_https,
                              name: usr.name)

    result
  end

end
