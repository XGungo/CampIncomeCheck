module DualContentCheck
    def dual_content_check(channel_id, received_text)
        case dual_status(channel_id)
        when :admin
        when :user 
        when :unregisted
            admin_regist(channel_id,received_text)
            user_regist(channel_id, received_text)
        end 
    end
    def dual_status(channel_id)
        if not AdminList.where(channel_id: channel_id).empty?
            name = AdminList.where(channel_id: channel_id).last&.name
            p "Admin, #{name}, has been check."
            return :admin 
        elsif not UserList.where(channel_id: channel_id).empty?
            name = UserList.where(channel_id: channel_id).last&.name
            p "User, #{name}, has been check."
            return :user 
        else
            return :unregisted
        end
    end
    def admin_regist(channel_id,received_text)
        return nil unless received_text[0..5] == 'admin;'
        name = received_text[6..-1]
        AdminList.create(channel_id: channel_id, name: name)
        p "#{name},have just registed Admin"
    end
    def user_regist(channel_id,received_text)
        ini_score = 1000
        return nil unless received_text[0..4] == 'user;'
        name = received_text[5..-1]
        UserList.create(channel_id: channel_id, name: name, dual_score: ini_score)
        p "#{name},have just registed User"
    end
    # merged_regist 
    # def regist(channel_id, received_text, dual_status)
    #     status = dual_status.to_s
    #     return nil unless received_text.index(status + ';') != 0
    #     name_index = status.size + 1
    #     name = received_text[name_index..-1]
    # end

end