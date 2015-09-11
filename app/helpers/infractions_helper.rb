module InfractionsHelper

  def decorated_time(infraction)
    infraction.tweet.created_at
  end

  def decorated_description(infraction)
    infraction.description.gsub(/(@infractoresba)/i,
                                "<a href='https://twitter.com/InfractoresBA' target='_blank'>@InfractoresBA</a> ")
  end

end
