class Evidence < ActiveRecord::Base
  belongs_to :infraction

  mount_uploader :media, EvidenceUploader

  # Builds an [Array] of [Evidence] records from a [Tweet] using the media
  # entities
  #
  # @param tweet [Tweet]
  # @return [Array]
  def self.build_from(tweet)
    result = []
    tweet.source.extended_entities["media"].each do |media|
      result << self.new(infraction: tweet.infraction,
                         media: media["media_url_https"])
    end
    result
  end
end
