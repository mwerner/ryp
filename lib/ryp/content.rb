module Ryp
  class Content
    attr_reader :type, :network, :value, :data

    ETH_ADDRESS_REGEX = /^0x[a-fA-F0-9]{40}$/
    ETH_TRANSACTION_REGEX = /^0x([A-Fa-f0-9]{64})$/

    BTC_ADDRESS_REGEX = /^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$/
    BTC_TRANSACTION_REGEX = /^[a-zA-Z0-9]{64}$/

    MATCHERS = {
      eth: {
        address: ETH_ADDRESS_REGEX,
        transaction: ETH_TRANSACTION_REGEX
      },
      btc: {
        address: BTC_ADDRESS_REGEX,
        transaction: BTC_TRANSACTION_REGEX
      }
    }

    def initialize(type:, network:, value:)
      @type = type
      @network = network
      @value = value
    end

    def self.discover(data, options = {})
      value, network, type = *[data, determine_content(data, options)].flatten

      new(type: type, network: network, value: data)
    end

    # Allow passing { network: 'n' } to specify a network
    def self.determine_content(data, options = {})
      specified_network = options[:network] && options[:network].downcase.to_sym

      puts "Determining Content: #{[data, options].inspect}" if options[:verbose]
      MATCHERS.each_pair do |network, matchers|
        next if specified_network && specified_network != network

        matchers.each_pair do |type, expression|
          return [network, type] if data =~ expression
        end
      end

      [specified_network || :unknown, :unknown]
    end

    def fetch_data!
      raise Ryp::UnknownContentType, 'Unkown Content Type' if type == :unknown
      @data = client.send(type, self)
    rescue Ryp::BadResponseError => e
      puts e
    end

    def client
      @client ||= Ryp::Client.new(network)
    end
  end
end
