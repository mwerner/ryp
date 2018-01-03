require 'ryp/version'
require 'json'

module Ryp
  require 'ryp/client'
  require 'ryp/command'
  require 'ryp/content'
  require 'ryp/errors'
  require 'ryp/presenter'
  require 'ryp/resource'

  require 'ryp/bitcoin_address'
  require 'ryp/bitcoin_transaction'

  require 'ryp/ethereum_address'
  require 'ryp/ethereum_transaction'

  module DataSource
    require 'ryp/data_source/base'
    require 'ryp/data_source/block_cypher'
    require 'ryp/data_source/blockchain_info'
  end

  def self.info(args, options = {})
    options = options.each_with_object({}) { |(k,v), h| h[k.to_sym] = v }
    content = Ryp::Content.discover(args, options)
    presenter = Ryp::Presenter.new(content.network)

    puts "[\"#{content.type}\"] on [\"#{content.network}\"]: #{content.value}" if options[:verbose]
    content.fetch_data!
    presenter.present(content)
  rescue Ryp::UnknownContentType => e
    puts "Unable to identify #{content.value} on the #{content.network} network"
  end

  def self.ticker_to_name(ticker)
    {
      eth: 'Ethereum',
      btc: 'Bitcoin'
    }[ticker.to_s.downcase.to_sym]
  end
end
