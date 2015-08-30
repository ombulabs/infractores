require 'rails_helper'

RSpec.describe Infraction do
  describe "Infraction.build_from" do
    let(:tweet) { FactoryGirl.create(:valid_tweet) }

    context "valid infraction tweet" do
      subject { Infraction.build_from(tweet) }

      it "builds a Location and associates it with the Infraction" do
        expect(subject.location).to be
      end

      it "builds many Evidences and associates it with the Infraction" do
        expect(subject.evidences).not_to be_empty
      end

      it "associates the Infraction with the original tweet" do

      end
    end
  end
end
