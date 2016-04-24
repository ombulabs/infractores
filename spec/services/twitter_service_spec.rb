require 'rails_helper'

RSpec.describe "TwitterService" do
  let(:twitter_service) { TwitterService.instance }
  let(:filename) { 'valid-infraction.json' }
  let(:tweet_json) { File.read(Rails.root.join('spec', 'support', filename)) }
  let(:tweet) { Twitter::Tweet.new(id: 1234) }

  before do
    allow(tweet).to receive(:to_json).and_return(tweet_json)
  end

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
        allow(twitter_service.client)
          .to(receive(:mentions_timeline)
            .and_return([tweet]))
        allow(twitter_service.client)
          .to(receive(:search)
            .and_return([tweet]))
        allow(twitter_service.client)
          .to(receive(:status)
            .and_return(tweet))
        allow(twitter_service)
          .to(receive(:screen_name)
            .and_return("InfractoresBA"))
      end

      it "creates one Tweet per mention and search" do
        expect do
          twitter_service.download_tweets
        end.to change(Tweet, :count).by(1)
      end

      it "creates one and only one Tweet per mention and search" do
        expect do
          twitter_service.download_tweets
          twitter_service.download_tweets
        end.to change(Tweet, :count).by(1)
      end

      context 'tweet without geo' do
        let(:filename) { 'infraction-without-geo.json' }

        it 'create tweet' do
          expect do
            VCR.use_cassette("user-tweets") do
              twitter_service.download_tweets
            end
          end.to change(Tweet, :count).by(1)
        end
      end

      context 'tweet without media' do
        let(:filename) { 'infraction-without-media.json' }

        it 'create tweet' do
          expect do
            VCR.use_cassette("user-tweets") do
              twitter_service.download_tweets
            end
          end.to change(Tweet, :count).by(1)
        end
      end
    end

    context "search and mentions return 15 tweets" do
      it "creates one Tweet per mention and search" do
        expect do
          VCR.use_cassette("search-tweets") do
            twitter_service.download_tweets
          end
        end.to change(Tweet, :count).by(20)
      end
    end
  end
end
