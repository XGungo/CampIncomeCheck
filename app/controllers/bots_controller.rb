require 'content_check'
class BotsController < LineSettingsController
    protect_from_forgery with: :null_session
    include ContentCheck
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
    

    # merged_regist 
    # def regist(channel_id, received_text, dual_status)
    #     status = dual_status.to_s
    #     return nil unless received_text.index(status + ';') != 0
    #     name_index = status.size + 1
    #     name = received_text[name_index..-1]
    # end

    def group_content_check(channel_id, received_text)
        unless TeamList.where(channel_id: channel_id).empty?
            name = TeamList.where(channel_id: channel_id).last&.team_name
            p "Team, #{name}, is doing something"
        else
            p TeamList.where(channel_id: channel_id)
            team_regist(channel_id,received_text)
        end
    end
    def team_regist(channel_id,received_text)
        return nil unless received_text[0..6] == 'regist;'
        name = received_text[7..-1]
        TeamList.create(channel_id: channel_id, name: name)
        p "#{name},have just registed"
    end    

end
