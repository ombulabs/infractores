require 'rails_helper'

RSpec.describe Evidence do
  describe "Evidence.build_from" do
    let!(:tweet) { FactoryGirl.create(:valid_tweet) }
    let!(:infraction) { FactoryGirl.build(:infraction, tweet: tweet)}

    context "valid infraction tweet" do
      before do
        stub_request(:get, /https:\/\/pbs.twimg.com\/media\/.*.jpg/)
          .to_return(status: 200,
                     body:  lambda { |request| File.new(Rails.root + 'spec/support/valid-picture.jpg') })

        @evidences = Evidence.build_from(tweet)
        @evidences.each {|ev| ev.save! }
      end

      it "builds evidences and associates them with the Infraction" do
        @evidences.each do |ev|
          expect(ev.infraction).to eql(infraction)
        end
      end

      it "builds many evidences and uploads it to S3" do
        @evidences.each do |ev|
          expect(ev.media.url).to be
          expect(ev.media.url).not_to be_blank
        end
      end
    end
  end
end
