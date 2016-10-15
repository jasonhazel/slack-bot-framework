module Junkrat
  module Commands
    class Lookup < SlackRubyBot::Commands::Base
      command 'lookup' do |client, data, _match|
        if _match[:expression].nil?
          user = Junkrat::User.where(slack_id: data.user).first
        elsif _match[:expression].include? '<@'
          user = Junkrat::User.where(slack_id: _match[:expression].delete('<@').delete('>')).first
        else
          user = Junkrat::User.where(gamertag: _match[:expression]).first
          user ||= Junkrat::User.new(gamertag: _match[:expression])
        end


        unless user.nil?
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
            { color: '#000', title: ":overwatch: Stats for #{user.gamertag}", text: template % map }
          ])
        end
      end
    end
  end
end
