module ApplicationHelper
  def alert_notice
    if alert || notice
      'big-font'
    else
      'd-none'
    end
  end

  def background_style
    return if current_user.nil?

    if current_page?(user_path(current_user)) ||
       (current_page?(controller: 'groups') &&
       current_page?(action: 'index'))
      'bg-gradient-blue'
    else
      'bg-white'
    end
  end

  def bg(style)
    return '-light' if style == 'bg-gradient-blue'
  end

  def logged_in_nav
    return unless current_user

    link_to('Log Out', destroy_user_session_path, method: :delete,\
                                                  class: "btn#{bg(background_style)} med-font mb-1 p-2 col")\
      .concat(' ')
      .concat(link_to('Profile', user_path(current_user), class: "btn#{bg(background_style)} med-font mb-1 p-2 col"))
  end
end
