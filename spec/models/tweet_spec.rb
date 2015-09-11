require 'rails_helper'

RSpec.describe Tweet do
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
