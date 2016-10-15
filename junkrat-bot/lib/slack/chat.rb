module Slack
  module Message
    class Base
      def initialize(options = {})
        @client = options[:client]
        @data = options[:data]
      end
    end


    class Text < Base
      def send(message)
        @client.say(channel: data.channel, text: message)
      end
    end

    class Card < Base
      def send(attachments)
        @client.web_client.chat_postMessage(
          channel: @data.channel,
          as_user: true,
          attachments: attachments
        )
      end
    end
  end
end



#
#
# Junkrat.card(client, data, [{
#         color: '#000',
#         title: ":junkrat: #{user.name}'s Overwatch Stats",
#         text: ":white_check_mark: #{user.wins} :clock430: #{user.time_played} :skull: #{user.eliminations} :yellow_heart: #{user.healing_done} :heart: #{user.damage_done}"
#       }])
