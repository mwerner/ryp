module Ryp
  class Coin
    attr_reader :name, :ticker, :aliases

    def initialize(attrs = {})
      @name = attrs[:name]
      @ticker = attrs[:ticker]
      @aliases = attrs[:aliases] || []
    end

    def market
      @market ||= Ryp::Market.new(ticker)
    end
  end
end
