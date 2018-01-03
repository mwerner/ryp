module Ryp
  class Client
    attr_reader :network, :client

    # ETH: https://www.blockcypher.com/dev/ethereum/
    # BTC: https://www.blockcypher.com/dev/bitcoin/

    def initialize(network)
      @network = network.to_s.downcase.to_sym
      raise ArgumentError, 'Unknown Network' if network.nil? || network == :unknown
      @client = send("#{network}_data_source")
    end

    def transaction(arg)
      data_class('Transaction').new.tap do |transaction|
        transaction.parse! client.transaction(arg)
      end
    end

    def address(arg)
      data_class('Address').new.tap do |address|
        address.parse! client.address(arg)
      end
    end

    # `content_type` accepts Address and Transaction
    def data_class(content_type)
      network_name = Ryp.ticker_to_name(network)
      Ryp.const_get("#{network_name}#{content_type}")
    end

    private

    def eth_data_source
      @eth_client ||= Ryp::DataSource::BlockCypher.new(:eth)
    end

    def btc_data_source
      @btc_client ||= Ryp::DataSource::BlockCypher.new(:btc)
    end
  end
end
