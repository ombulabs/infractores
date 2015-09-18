class Location < ActiveRecord::Base
  has_many :infractions

  # It uses the geo coordinates to find or create a location
  #
  # @param tweet [Tweet]
  # @return [Location]
  def self.find_or_create!(tweet)
    return unless tweet.source.geo

    lat = tweet.source.geo["coordinates"][0]
    lon = tweet.source.geo["coordinates"][1]

    find_or_create_by(lon: lon, lat: lat)
  end

end
