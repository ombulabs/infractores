class Tweet < ActiveRecord::Base
  self.primary_key = :id

  validates :id, :json, presence: true
  validates :id, uniqueness: true
end
