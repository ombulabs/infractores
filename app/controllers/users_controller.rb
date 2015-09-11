class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.where("infractions_count > 0").order("infractions_count DESC")
  end

  # GET /users/:twitter_username
  def show
    @user = User.where(username: params[:username])
  end

end
