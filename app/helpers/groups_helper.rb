module GroupsHelper
  def group_icon(group)
    if group.nil? || !group.icon.attached?
      image_tag 'icon_holder.png', class: 'icon'
    else
      image_tag group.icon, class: 'icon'
    end
  end
end
