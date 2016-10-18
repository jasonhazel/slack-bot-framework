module Overwatch

  class Stats < Base

    attr_accessor :user

    def initialize(options={})
      @user = options[:user] || nil
      @name = options[:name]
      @platform = options[:platform] || 'xbl'

      require 'httparty'
      require 'uri'

      @stats = JSON.parse(
        HTTParty.get(
          URI.escape("#{BASE_URL}/u/#{@name}/stats?platform=#{@platform}")
        ).body,
        object_class: OpenStruct
      )
    end

    def value(key, type = :quickplay)
      # TODO: Extend to allow competetive
      return nil if @stats.any.nil?
      @stats.any.stats.send(type).game_stats.send(key)
    end
  end
end
