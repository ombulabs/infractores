class Infraction < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :location

  has_many :evidences
  has_one :user, through: :tweet

  validates_presence_of :evidences
  validates_presence_of :location

  delegate :lat, :lon, to: :location
  delegate :source_url, to: :tweet
  delegate :username, :update_infractions_counter!, to: :user

  after_save :update_infractions_counter!

  scope :legitimate, -> { where(legitimate: true) }

  # Builds an {Infraction} using the {Tweet}
  #
  # @param tweet [Tweet]
  # @return [Infraction]
  def self.build_from(tweet)
    result = self.new(tweet: tweet, description: tweet.source.text)
    json = tweet.json

    result.location = Location.find_or_create!(tweet)
    result.evidences = Evidence.build_from(tweet)

    result
  end

end
