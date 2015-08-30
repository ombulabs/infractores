require 'rails_helper'

RSpec.describe Evidence do
  describe "Evidence.build_from" do
    let!(:tweet) { FactoryGirl.create(:valid_tweet) }
    let!(:infraction) { FactoryGirl.build(:infraction, tweet: tweet)}

    context "valid infraction tweet" do
      before do
        @evidences = Evidence.build_from(tweet)
      end

      it "builds evidences and associates them with the Infraction" do
        @evidences.each do |ev|
          expect(ev.infraction).to eql(infraction)
        end
      end

      it "builds many evidences and uploads it to S3" do
        @evidences.each do |ev|
          expect(ev.media).to be
        end
      end

      it "associates the Infraction with the original tweet" do

      end
    end
  end
end
