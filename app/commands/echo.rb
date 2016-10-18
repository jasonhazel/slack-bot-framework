module Commands
  class Echo < SlackRubyBot::Commands::Base
    command 'echo' do |client, data, _match|
      Slack::Message::Text.new(client: client, data: data).send(_match[:expression])
    end
  end
end
