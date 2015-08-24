class TwitterService

  @@instance = nil

  def self.instance
    @@instance ||= TwitterService.new
    @@instance
  end

  attr_accessor :client

  # Downloads all the new mentions since the last mention. Creates all the
  # necessary {Tweet} records.
  def download_mentions
    opts = {}
    opts[:since_id] = tweet.id if tweet = Tweet.last

    tl = client.mentions_timeline opts

    tl.each do |tuit|
      Tweet.create!(id: tuit.id, json: tuit.to_json)
    end
  end

  private

  def initialize
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end

    self.client = client
  end

end
