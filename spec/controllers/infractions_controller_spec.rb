require "rails_helper"

describe InfractionsController, type: :controller do
  render_views

  let(:evidence) { Evidence.new }
  let!(:infraction) do
    FactoryGirl.create(:infraction,
                       lat: 13.37,
                       lon: 13.37,
                       evidences: [evidence])
  end

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
    it "successful" do
      get :show, id: infraction.tweet_id

      expect(response.status).to eq(200)
    end
  end
end
