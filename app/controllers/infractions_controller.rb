class InfractionsController < ApplicationController

  # GET /infractions
  def index
    @infractions = Infraction.order("ID DESC")
  end

  # GET /infractions/:id
  def show
    @infraction = Infraction.find(params[:id])
  end
end
