require 'slack-ruby-bot'
require 'active_support'

module Bot
  class Application < SlackRubyBot::Bot

  end
end

# TODO: better autoloading.
autoload_paths = [
  Dir[File.dirname(__FILE__) + '/initializers/*.rb'],
  Dir[File.dirname(__FILE__) + '/app/**/*.rb'],
  Dir[File.dirname(__FILE__) + '/lib/**/*.rb']
]

autoload_paths.flatten.each { |file| require file }
