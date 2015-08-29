class Infraction < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :location

  has_many :evidences

  # Builds an {Infraction} using the {Tweet}
  #
  # @param tweet [Tweet]
  # @return [Infraction]
  def self.build_from(tweet)
    result = self.new(tweet: tweet)
    json = tweet.to_json

    begin
      result.location = Location.find_or_create!(tweet)

      byebug
      puts "x"

    rescue Exception => e
    end

    result
  end

end
