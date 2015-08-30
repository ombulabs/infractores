class User < ActiveRecord::Base
  has_many :tweets

  validates :username, :name, :twitter_user_id, presence: true

  # It uses a {Tweet} to find and update an existing {User} or create
  # a new one
  #
  # @param tuit [Tweet]
  # @return [User]
  def self.find_or_create!(tuit)
    usr = OpenStruct.new(tuit.source["user"])

    if result = User.find_by(twitter_user_id: usr.id)
      result.update_attributes!(username: usr.screen_name,
                                profile_image_url: usr.profile_image_url_https,
                                name: usr.name)
    else
      result = User.new(username: usr.screen_name,
                        profile_image_url: usr.profile_image_url_https,
                        name: usr.name,
                        twitter_user_id: usr.id)

      result.save!
    end

    result
  end

end
