require 'thor'
require 'ryp'

module Ryp
  class Command < Thor
    desc "info", "Pull information on an address"
    def info(id)
      puts 'hi'
    end

    desc "market", "Pull information about a market"
    def market(ticker)
      market = Ryp::Market.new(ticker)
      puts market.data
    end
  end
end
