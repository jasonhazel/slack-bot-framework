module Junkrat
  module Commands
    class Lookup < SlackRubyBot::Commands::Base
      command 'lookup' do |client, data, _match|
        user = ::Overwatch::User.new(name: _match[:expression])

        template = ":white_check_mark: %{wins} :clock430: %{played}h :skull: %{eliminations} :yellow_heart: %{healing} :heart: %{damage}"
        map = {
          wins: user.stat(:games_won).to_i,
          played: user.stat(:time_played),
          eliminations: user.stat(:eliminations).to_i,
          healing: user.stat(:healing_done).to_i,
          damage: user.stat(:damage_done).to_i
        }

        message = ::Slack::Message::Card.new(client: client, data: data)
        message.send([
          { color: '#000', title: ":overwatch: Stats for #{_match[:expression]}", text: template % map }
        ])

      end
    end
  end
end
