module InfractionsHelper

  def decorated_time(infraction)
    infraction.tweet.created_at
  end

end
