namespace :twitter do
  task download_tweets: :environment do
    puts "Downloading mentions"
    TwitterService.instance.download_tweets
    puts "Downloaded mentions"
  end

  task populate_reported_at: :environment do
    puts "Populating reported_at"
    Infraction.all.find_each do |infraction|
      infraction.reported_at = infraction.tweet.source["created_at"]
      infraction.save!
    end  
    puts "Populated reported_at"
  end
end
