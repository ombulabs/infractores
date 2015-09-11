namespace :users do
  task update_infractions_counter: :environment do
    puts "Updating leaderboard"
    User.find_each do |usr|
      usr.update_infractions_counter!
    end
    puts "Updated leaderboard"
  end
end
