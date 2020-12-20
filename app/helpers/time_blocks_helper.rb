module TimeBlocksHelper
    def group_icon(time_block)
        if time_block.groups.first.nil?
            return
        else
            image_tag time_block.groups.first.icon, class: 'icon'
        end
    end
end
