module Junkrat
  class User < ActiveRecord::Base
    def stats
      @overwatch ||= ::Overwatch::User.new(name: gamertag).stats
    end

    def stat(key)
      return nil if stats.any.nil?
      stats.any.stats.quickplay.game_stats.send(key)
    end
  end
end
