class InfractionsController < ApplicationController

  # GET /infractions
  def index
    @infractions = Infraction.includes(:evidences, :tweet, :location, :user).order("ID DESC")
  end

  # GET /infractions/:id
  def show
    @infraction = Infraction.includes(:user).find_by(tweet_id: params[:id])
  end
end
