module ApplicationHelper
  def logged_in_links
    return unless current_user

    link_to('Log Out', logout_path)\
      .concat(' ')
      .concat(link_to('Profile', user_path(current_user)))
  end
end
