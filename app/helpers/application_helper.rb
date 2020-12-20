module ApplicationHelper
    def alert_notice
        unless (alert || notice)
            'd-none' 
        else
            'big-font'
        end
    end
end
