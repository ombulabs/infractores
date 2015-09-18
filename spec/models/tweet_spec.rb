require 'rails_helper'

RSpec.describe Tweet do
  let!(:valid_tweet) { FactoryGirl.create(:valid_tweet) }

  describe "#created_at" do
    it "returns the tweet creation date" do
      time = Time.parse("2015-08-28 12:40:47 -0300")
      expect(valid_tweet.created_at).to eql time
    end
  end

  describe "#source_url" do
    it "returns a twitter status url" do
      username = valid_tweet.user.username
      expect(valid_tweet.source_url).to eql "https://twitter.com/#{username}/status/637288728814317568"
    end
  end

  describe "#valid?" do
    it "needs a user, json and id" do
      tweet = Tweet.new
      expect(tweet.valid?).to be_falsey
      expect(tweet.errors.full_messages).to include("Id no puede estar en blanco")
      expect(tweet.errors.full_messages).to include("Json no puede estar en blanco")
      expect(tweet.errors.full_messages).to include("User no puede estar en blanco")
    end

    it "needs a unique id" do
      FactoryGirl.create(:tweet, id: "123")
      tweet = FactoryGirl.build(:tweet, id: "123")
      expect(tweet.valid?).to be_falsey
      expect(tweet.errors.full_messages).to include("Id ya está en uso")
    end
  end
end
