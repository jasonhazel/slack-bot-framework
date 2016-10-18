module Application
  module Commands
    class Echo < SlackRubyBot::Commands::Base
      command 'echo' do |client, data, _match|
        Slack::Message::Text.new(client: client, data: data).send(
          "#{Slack::User.from_data(data)} wanted me to say *#{_match[:expression]}*"
        )
      end
    end
  end
end
