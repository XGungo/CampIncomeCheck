module GroupContentCheck
    def group_content_check(channel_id, received_text)
        case group_status(channel_id)
        when :registed

        when :unregisted
            team_regist(channel_id,received_text)
        end 
    end
    def group_status(channel_id)
        if not TeamList.where(channel_id: channel_id).empty?
            name = TeamList.where(channel_id: channel_id).last&.team_name
            p "Team, #{name}, has been check."
            return :group 
        else
            return :unregisted
        end
    end
    def team_regist(channel_id,received_text)
        return nil unless received_text[0..6] == 'regist;'
        ini_score = 1000
        name = received_text[7..-1]
        TeamList.create(channel_id: channel_id, team_id: 0, team_name: name, total_score: ini_score)
        p "#{name},have just registed"
    end    
end