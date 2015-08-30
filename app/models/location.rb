class Location < ActiveRecord::Base
  has_many :infractions

  # It uses the geo coordinates to find or create a location
  #
  # @param tweet [Tweet]
  # @return [Location]
  def self.find_or_create!(tweet)
    return unless tweet.source.geo
    
    x = tweet.source.geo["coordinates"][0]
    y = tweet.source.geo["coordinates"][1]
    point = "POINT(#{x} #{y})"

    unless result = find_by(lonlat: point)
      result = new(lonlat: point)
      result.save!
    end

    result
  end

end
