require 'dual_content_check'
require 'group_content_check'
class BotsController < LineSettingsController
    protect_from_forgery with: :null_session
    include DualContentCheck
    include GroupContentCheck
    def webhook()      
        case channel_status(source)
        when 'group', 'room'
            group_content_check(channel_id, received_text)
        when 'user'
            dual_content_check(channel_id, received_text)
            p "#{received_text}"
        end
        head :ok
    end
    




end
