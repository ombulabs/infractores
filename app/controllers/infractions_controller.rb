class InfractionsController < ApplicationController
  before_filter :load_scope, only: [:index]

  # GET /infractions
  def index
    @infractions = @scope.order("infractions.id DESC")
  end

  # GET /infractions/:id
  def show
    @infraction = Infraction.includes(:user).find_by(tweet_id: params[:id])
  end

  private

  def load_scope
    @scope = Infraction.includes(:evidences, :tweet, :location, :user)
    if params[:username]
      @scope = @scope.where("users.username" => params[:username])
    end
  end
end
