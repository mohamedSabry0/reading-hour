module ApplicationHelper
  def alert_notice
    if alert || notice
      'big-font'
    else
      'd-none'
    end
  end

  def logged_in_nav
    return unless current_user

    link_to('Log Out', destroy_user_session_path, method: :delete, class: 'btn big-font mb-1 p-1')\
      .concat(' ')
      .concat(link_to('Profile', user_path(current_user), class: 'btn big-font mb-1 p-1'))
  end
end
