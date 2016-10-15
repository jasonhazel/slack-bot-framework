module Junkrat
  module Commands
    class Register < SlackRubyBot::Commands::Base
      command 'register' do |client, data, _match|

        user = Junkrat::User.where(slack_id: data.user).first
        user ||= Junkrat::User.new(slack_id: data.user)

        user.gamertag = _match[:expression]
        user.save
        message = ::Slack::Message::Card.new(client: client, data: data)
        message.send([
          { color: '#000', title: "Gamertag Registered", text: "#{user.gamertag} is now registered to <@#{user.slack_id}>" }
        ])
      end
    end
  end
end
