class TweetInspector
  include Sidekiq::Worker

  # It analyzes a {Tweet} and creates an {Infraction} if necessary
  def perform(id)
    if (tweet = Tweet.find_by(id: id))
      return if tweet.infraction

      infraction = Infraction.build_from(tweet)

      if infraction.save
        puts "Great success!"
      else
        # TODO Notify user? 
      end
    end
  end
end
