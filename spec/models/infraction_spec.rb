require 'rails_helper'

RSpec.describe Infraction do
  describe "Infraction.build_from" do
    let(:tweet) { FactoryGirl.create(:valid_tweet) }

    context "valid infraction tweet" do
      subject { Infraction.build_from(tweet) }

      it "extracts geoinfos from tweet" do
        expect(subject.lat).to eq(-34.58255407)
        expect(subject.lon).to eq(-58.43625901)
      end

      it "invalid without lat" do
        subject.lat = nil
        expect(subject).to_not be_valid
      end

      it "invalid without lon" do
        subject.lon = nil
        expect(subject).to_not be_valid
      end

      it "builds many Evidences and associates it with the Infraction" do
        expect(subject.evidences).not_to be_empty
      end

      it "associates the Infraction with the original tweet" do

      end
    end
  end
end
