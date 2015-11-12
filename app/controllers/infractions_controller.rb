class InfractionsController < ApplicationController
  before_filter :load_scope, only: [:index]

  # GET /infractions
  def index
    @infractions = @scope.legitimate.order("infractions.created_at ASC")
    @infraction_markers = @infractions.pluck(:lat, :lon, :id)
  end

  # GET /infractions/:id
  def show
    @infraction = Infraction.includes(:user).find_by(tweet_id: params[:id])
  end

  private

  def load_scope
    @scope = Infraction.includes(:evidences, :tweet, :user)
    if params[:username]
      @scope = @scope.where("users.username" => params[:username])
    end
  end
end
