namespace :twitter do
  task download_tweets: :environment do
    puts "Downloading mentions"
    TwitterService.instance.download_tweets
    puts "Downloaded mentions"
  end
end
