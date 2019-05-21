
class BotsController < ApplicationController
    protect_from_forgery with: :null_session
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
    def source
        params['events'][0]['source']
    end
    def channel_id
        source['groupId'] || source['roomId'] || source['userId']
    end
    def channel_status(source)
        source['type']
    end
        
    def dual_content_check(channel_id, received_text)
        if AdminList.find_by_id(channel_id)
            name = AdminList.find_ny_id(channel_id).name
            p "#{name} is a admin"
        else
            admin_regist(channel_id,received_text)
            
        end
    end
    def admin_regist(channel_id,received_text)
        if received_text[0..6] == "regist;"
            name = received_text[7..-1]
            AdminList.create(channel_id: channel_id, name: name)
            p "#{name},have registed"
        end
    end

    def group_content_check(channel_id, received_text)

    end
    
    def received_text
        message = params['events'][0]['message']
        message['text'] unless message.nil?
    end

    def test
        render plain:'welcome'
    end
end
