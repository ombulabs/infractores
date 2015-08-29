require 'rails_helper'

RSpec.describe Tweet do
  describe "#valid?" do
    it "needs a user, json and id" do
      tweet = Tweet.new
      expect(tweet.valid?).to be_falsey
      expect(tweet.errors.full_messages).to include("Id can't be blank")
      expect(tweet.errors.full_messages).to include("Json can't be blank")
      expect(tweet.errors.full_messages).to include("User can't be blank")
    end
  end
end
