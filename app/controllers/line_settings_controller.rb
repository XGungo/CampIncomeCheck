require 'line/bot'
require 'net/http'
class LineSettingsController < ApplicationController
    def source
        params['events'][0]['source']
    end
    def channel_id
        source['groupId'] || source['roomId'] || source['userId']
    end
    def channel_status(source)
        source['type']
    end
    def received_text
        message = params['events'][0]['message']
        message['text'] unless message.nil?
    end

    def test
        render plain:'welcome'
    end
end
