module Slack
  class User
    attr_accessor :id

    def initialize(id = nil)
      @id = id
    end

    def to_mention
      "<@#{@id}>"
    end

    def valid?
      !@id.nil?
    end

    class << self
      def from_mention(expression)
        new(expression.delete('<@').delete('>')) if expression.include? '<@'
      end

      def from_data(data)
        new(data.user)
      end

      def from_mention_or_data(mention, data)
        from_mention(mention) || (mention.nil? ? from_data(data) : new)
      end
    end
  end
end
