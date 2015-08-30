class Infraction < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :location

  has_many :evidences

  validates_presence_of :evidences

  # Builds an {Infraction} using the {Tweet}
  #
  # @param tweet [Tweet]
  # @return [Infraction]
  def self.build_from(tweet)
    result = self.new(tweet: tweet)
    json = tweet.json

    begin
      result.location = Location.find_or_create!(tweet)
      result.evidences = Evidence.build_from(tweet)
    rescue Exception => e
      raise e
    end

    result
  end

end
