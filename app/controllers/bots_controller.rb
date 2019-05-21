
class BotsController < ApplicationController
    protect_from_forgery with: :null_session
    def webhook()      
        case channel_status(source)
        when 'group', 'room'
            group_content_check(channel_id, recieved_text)
        when 'user'
            # dual_content_check(channel_id, recieved_text)
            p 'did'
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
        
    def dual_content_check(channel_id, recieved_text)
        unless AdminList.where(channel_id: channel_id).nil?
            p 'you,#{recieved_text[7..-1]},are the admin'
        else
            admin_regist(channel_id,recieved_text)
            p 'you,#{recieved_text[7..-1]},have registed'
        end
    end
    def admin_regist(channel_id,recieved_text)
        if recieved_text[0..6] == 'regist;'
            name = recieved_text[7..-1]
            AdminList.create(channel_id: channel_id, name: name)
        end
    end

    def group_content_check(channel_id, recieved_text)

    end
    
    def recieved_text
        message = params['event'][0]['message']
        message['text'] unless message.nil?
    end

    def test
        render plain:'welcome'
    end
end
