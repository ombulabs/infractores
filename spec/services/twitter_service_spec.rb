require 'rails_helper'

RSpec.describe "TwitterService" do
  subject { TwitterService.instance }

  describe "#instance" do
    it "returns an instance of TwitterService" do
      inst = TwitterService.instance
      expect(inst.class).to eql(TwitterService)
    end

    it "returns the same instance every time" do
      inst_1 = TwitterService.instance
      inst_2 = TwitterService.instance
      expect(inst_1).to eql(inst_2)
    end
  end

  describe "#download_mentions" do
    before do
      allow(subject.client)
        .to(receive(:mentions_timeline)
              .and_return([valid_twitter_tweet]))
    end

    it "creates one Tweet per mention" do
      expect do
        subject.download_mentions
      end.to change(Tweet, :count).by(1)
    end

    it "creates one and only one Tweet per mention" do
      expect do
        subject.download_mentions
        subject.download_mentions
      end.to change(Tweet, :count).by(1)
    end
  end
end
