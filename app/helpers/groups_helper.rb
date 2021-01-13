module GroupsHelper
  def group_icon(group)
    if group.nil? || !group.icon.attached?
      'no icon'
    else
      image_tag group.icon, class: 'icon'
    end
  end
end
