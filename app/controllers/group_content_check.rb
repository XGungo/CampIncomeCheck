module GroupContentCheck
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