module TimeBlocksHelper
  def group_icon(object)
    if object.class == TimeBlock && (object.groups.first.nil? || !object.groups.first.icon.attached?)
      'no icon'
    elsif object.class == TimeBlock
      image_tag object.groups.first.icon, class: 'icon'
    elsif object.class == Group && (object.nil? || !object.icon.attached?)
      'no icon'
    elsif object.class == Group
      image_tag object.icon, class: 'icon'
    end
  end
end
