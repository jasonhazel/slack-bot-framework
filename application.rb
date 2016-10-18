require 'slack-ruby-bot'
require 'active_support'
require 'sinatra/base'


# TODO: better autoloading.
autoload_paths = [
  Dir[File.dirname(__FILE__) + '/initializers/*.rb'],
  Dir[File.dirname(__FILE__) + '/app/**/*.rb'],
  Dir[File.dirname(__FILE__) + '/lib/**/*.rb']
]

autoload_paths.flatten.each { |file| require file }

module Application
  class Bot < SlackRubyBot::Bot

  end

  class Web < Sinatra::Base
    get '/' do
      'Online'
    end
  end
end
