module Junkrat
  module Commands
    class Lookup < SlackRubyBot::Commands::Base
      command 'lookup' do |client, data, _match|
        client.say(channel: data.channel, text: 'WIP')
      end
    end
  end
end
