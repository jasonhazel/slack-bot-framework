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
  end
end
