require 'slack-ruby-bot'
require 'active_support'

autoload_paths = [
  Dir[File.dirname(__FILE__) + '/initializers/*.rb'],
  Dir[File.dirname(__FILE__) + '/app/**/*.rb'],
  Dir[File.dirname(__FILE__) + '/lib/**/*.rb']
]

autoload_paths.flatten.each do |file|
  puts "Loading #{file}"
  require file
end

class Bot < SlackRubyBot::Bot

end
