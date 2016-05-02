require "rails_helper"

describe UsersController, type: :controller do
  render_views

  let(:user) { FactoryGirl.create(:user) }

  before do
    allow(TwitterService.instance).to receive(:screen_name).and_return("foobar")
  end

  describe "#index" do
    it "successful" do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    xit "successful" do
      get :show, id: user.id

      expect(response.status).to eq(200)
    end
  end
end
