require "ryp/version"
require 'yaml'

module Ryp
  require 'ryp/command'
  require 'ryp/market'

  require 'ryp/coin'
  require 'ryp/block'
  require 'ryp/input'
  require 'ryp/output'
  require 'ryp/transaction'

  module Clients
    require 'ryp/clients/blockchain_info'
    require 'ryp/clients/coin_market_cap'
  end

  def self.root
    File.expand_path(File.join(__dir__, '..'))
  end

  def self.coins
    tickers = YAML.load_file(File.join(Ryp.root, 'data/tickers.yml'))
    tickers.map { |attrs| Ryp::Coin.new(attrs) }
  end
end
