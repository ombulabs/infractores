class Tweet < ActiveRecord::Base
  self.primary_key = :id

  validates :id, :json, :user_id, presence: true
  validates :id, uniqueness: true

  belongs_to :user
  has_one :infraction

  after_save :enqueue_infraction_job

  # It uses a {Twitter::Tweet} to find and update an existing {Tweet} or create
  # a new one
  #
  # @param tuit [Twitter::Tweet]
  # @return [Tweet]
  def self.find_or_create!(tuit)
    user = User.find_or_create!(tuit)
    opts = {id: tuit.id, user: user}

    if result = self.find_by(opts)
      result.update_attributes!(json: tuit.to_json)
    else
      result = self.new(opts.merge(json: tuit.to_json))
      result.save!
    end

    result
  end

  private

  def enqueue_infraction_job
    TweetInspector.perform_async(self.id)
  end

end
