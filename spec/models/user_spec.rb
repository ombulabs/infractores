require 'rails_helper'

RSpec.describe User do
  describe "valid?" do
    it "expects username, name, twitter_user_id to be present" do
      expect(subject.valid?).to be_falsey
      expect(subject.errors.full_messages).to include("Username can't be blank")
      expect(subject.errors.full_messages).to include("Name can't be blank")
      expect(subject.errors.full_messages).to include("Twitter user can't be blank")
    end
  end

  context "valid tweet" do
    let!(:valid_tweet) { FactoryGirl.create(:valid_tweet) }

    describe "User.find_or_create!" do
      it "creates a valid user" do
        expect do
          User.find_or_create!(valid_tweet)
        end.to change(User, :count).by(1)

        user = User.last
        expect(user.name).to eql("Ernesto Tagwerker")
        expect(user.username).to eql("etagwerker")
      end
    end
  end
end
