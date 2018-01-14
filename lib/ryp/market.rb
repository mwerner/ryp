module Ryp
  class Market
    attr_reader :ticker

    def initialize(ticker)
      @ticker = ticker
    end

    def market_cap
      data[:market_cap]
    end

    def data
      {
        market_cap: api_data[:market_cap_usd]
      }
    end

    private

    def api_data
      client.market(ticker)
    end

    def client
      @client ||= Ryp::Clients::CoinMarketCap.new
    end
  end
end
