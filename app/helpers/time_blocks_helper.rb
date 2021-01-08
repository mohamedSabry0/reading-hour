module TimeBlocksHelper
  def group_icon(object)
    if object.class == TimeBlock
      if object.groups.first.nil? || !object.groups.first.icon.attached?
        nil
      else
        image_tag object.groups.first.icon, class: 'icon'
      end
    elsif object.nil? || !object.icon.attached?
      'no icon'
    else
      image_tag object.icon, class: 'icon'
    end
  end
end
