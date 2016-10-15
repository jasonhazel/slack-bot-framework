

module Junkrat
  class Bot < SlackRubyBot::Bot
    help do
      title 'Junkrat'
      desc 'Overwatch Stats'

      command 'lookup <username>' do
        desc 'Lookup stats for <username>'
      end
    end
  end
end
