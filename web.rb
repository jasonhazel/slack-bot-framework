require 'sinatra/base'

module Bot
  class Web < Sinatra::Base
    get '/' do
      'Online'
    end
  end
end
