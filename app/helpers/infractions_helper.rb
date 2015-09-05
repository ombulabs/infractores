module InfractionsHelper

  def decorated_description(infraction)
    infraction.description.gsub(/(@infractoresba)/i,
                                "<a href='https://twitter.com/InfractoresBA' target='_blank'>@InfractoresBA</a> ")
  end

  def decorated_username(infraction)
    username = infraction.username
    "<a href='https://twitter.com/#{username}' target='_blank'>@#{username}</a> "
  end

end
