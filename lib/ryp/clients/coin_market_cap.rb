module Ryp
  module Clients
    class CoinMarketCap

      # #market
      # @ticker: <String> The ticker of the market you're looking up
      #
      # id: "bitcoin",
      # name: "Bitcoin",
      # symbol: "BTC",
      # rank: "1",
      # price_usd: "573.137",
      # price_btc: "1.0",
      # "24h_volume_usd".to_sym => "72855700.0",
      # market_cap_usd: "9080883500.0",
      # available_supply: "15844176.0",
      # total_supply: "15844176.0",
      # percent_change_1h: "0.04",
      # percent_change_24h: "-0.3",
      # percent_change_7d: "-0.57",
      # last_updated: "1472762067"
      def market(ticker)
        {
          market_cap_usd: 10
        }
      end
    end
  end
end
