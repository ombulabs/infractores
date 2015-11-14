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

  describe "#download_tweets" do
    context "search and mentions return only one tweet" do
      before do
        allow(subject.client)
          .to(receive(:mentions_timeline)
                .and_return([valid_twitter_tweet]))
        allow(subject.client)
          .to(receive(:search)
                .and_return([valid_twitter_tweet]))
      end

      it "creates one Tweet per mention and search" do
        expect do
          subject.download_tweets
        end.to change(Tweet, :count).by(1)
      end

      it "creates one and only one Tweet per mention and search" do
        expect do
          subject.download_tweets
          subject.download_tweets
        end.to change(Tweet, :count).by(1)
      end
    end

    context "search and mentions return 15 tweets" do
      it "creates one Tweet per mention and search" do
        VCR.use_cassette("search-tweets") do
          VCR.use_cassette("mentions-tweets") do
            expect do
              subject.download_tweets
            end.to change(Tweet, :count).by(15)
          end
        end
      end
    end
  end
end
