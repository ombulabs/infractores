class Infraction < ActiveRecord::Base
  belongs_to :tweet

  has_many :evidences
  has_one :user, through: :tweet

  validates_presence_of :evidences

  delegate :source_url, to: :tweet
  delegate :username, :update_infractions_counter!, to: :user

  after_save :update_infractions_counter!

  scope :legitimate, -> { where(legitimate: true) }

  # Builds an {Infraction} using the {Tweet}
  #
  # @param tweet [Tweet]
  # @return [Infraction]
  def self.build_from(tweet)
    if tweet.source.geo
      lat = tweet.source.geo["coordinates"][0]
      lon = tweet.source.geo["coordinates"][1]
    else
      lat = lon = nil
    end

    result = self.new(
      tweet: tweet,
      description: tweet.source.text,
      lat: lat,
      lon: lon
    )

    json = tweet.json

    result.evidences = Evidence.build_from(tweet)

    result
  end

end
