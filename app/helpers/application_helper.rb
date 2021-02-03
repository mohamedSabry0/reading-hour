module ApplicationHelper
  def alert_notice
    if alert || notice
      nil
    else
      'd-none'
    end
  end

  def background_style
    return if current_user.nil?

    if current_page?(user_path(current_user)) ||
       current_page?('/') ||
       (current_page?(controller: 'groups') &&
       current_page?(action: 'index'))
      'bg-gradient-blue'
    else
      'bg-light-grey'
    end
  end

  def bg(style)
    return '-light' if style == 'bg-gradient-blue'
  end

  def logged_in_nav
    return unless current_user

    link_to('Profile', user_path(current_user), class: "btn#{bg(background_style)} mb-1 p-2")
  end
end
