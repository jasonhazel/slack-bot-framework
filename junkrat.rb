require 'active_record'

configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])


require 'pstore'
require 'slack-ruby-bot'
require 'active_support'
require 'lib/slack/chat'
require 'lib/overwatch/user'
require 'commands/lookup'

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
