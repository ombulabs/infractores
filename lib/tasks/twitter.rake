namespace :twitter do
  task download_mentions: :environment do
    puts "Downloading mentions"
    TwitterService.instance.download_mentions
    puts "Downloaded mentions"
  end
end
