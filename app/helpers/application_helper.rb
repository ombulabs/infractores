module ApplicationHelper

  def calculate_class(*arr)
    arr.any? {|x| current_page?("/#{x}") } ? 'active' : ''
  end

  def decorated_username(infraction)
    username = infraction.username
    "<a href='https://twitter.com/#{username}' target='_blank'>@#{username}</a>"
  end

  def screen_name
    "@#{TwitterService.instance.screen_name}"
  end

  def screen_name_hashtag
    "##{TwitterService.instance.screen_name}"
  end
end
