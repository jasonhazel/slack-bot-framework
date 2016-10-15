module Junkrat
  module Commands
    class Lookup < SlackRubyBot::Commands::Base
      command 'lookup' do |client, data, _match|
        user = ::Overwatch::User.new(name: _match[:expression])
        client.say(channel: data.channel, text: "Wins: #{user.stat(:games_won).to_i}")
      end
    end
  end
end
