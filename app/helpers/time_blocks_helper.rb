module TimeBlocksHelper
  def main_group_icon(time_block)
    if time_block.groups.first.nil? || !time_block.groups.first.icon.attached?
      'no icon'
    else
      image_tag time_block.groups.first.icon, class: 'icon'
    end
  end
end
