require 'sinatra/base'

module Junkrat
  class Web < Sinatra::Base
    get '/' do
      'Junkrat Online'
    end
  end
end
