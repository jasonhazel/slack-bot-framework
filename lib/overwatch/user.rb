module Overwatch
  class User

    attr_accessor :name

    def initialize(options={})
      @name = options[:name]
    end

    def stats
      require 'httparty'
      require 'uri'
      @stats ||= HTTParty.get(URI.escape("https://owapi.net/api/v3/u/#{@name}/stats?platform=xbl"))
      JSON.parse(@stats.body, object_class: OpenStruct)
    end

    def stat(key)
      return nil if stats.any.nil?
      stats.any.stats.quickplay.game_stats.send(key)
    end
  end
end
