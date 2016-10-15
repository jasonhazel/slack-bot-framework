require 'active_record'

configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection(configuration[ENV['RACK_ENV']])

require 'slack-ruby-bot'
require 'active_support'
require 'lib/slack/chat'
require 'lib/overwatch/user'
require 'commands/lookup'
require 'commands/register'
require 'models/user'

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
