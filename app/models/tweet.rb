class Tweet < ActiveRecord::Base
  self.primary_key = :id

  validates :id, :json, :user_id, presence: true
  validates :id, uniqueness: true

  belongs_to :user
  has_one :infraction

  validates_presence_of :user

  after_save :enqueue_infraction_job

  # It uses a {Twitter::Tweet} to find and update an existing {Tweet} or create
  # a new one
  #
  # @param tuit [Twitter::Tweet]
  # @return [Tweet]
  def self.find_or_create!(tuit)
    opts = {id: tuit.id}

    if result = self.find_by(opts)
      result.update_attributes!(json: tuit.to_json)
    else
      result = self.new(opts.merge(json: tuit.to_json))
      user = User.find_or_create!(result)
      result.user = user
      result.save!
    end

    result
  end

  def source
    @source ||= OpenStruct.new(JSON.load(json))
  end

  private

  def enqueue_infraction_job
    TweetInspector.perform_async(self.id)
  end

end
