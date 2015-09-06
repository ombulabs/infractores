class InfractionsController < ApplicationController

  # GET /infractions
  def index
    @infractions = Infraction.order("ID DESC")
  end

  # GET /infractions/:id
  def show
    @infraction = Infraction.find_by(tweet_id: params[:id])
  end
end
