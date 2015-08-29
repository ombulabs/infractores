namespace :twitter do
  task download_mentions: :environment do
    TwitterService.instance.download_mentions
  end
end
