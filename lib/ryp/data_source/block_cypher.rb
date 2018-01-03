require 'faraday'

module Ryp
  module DataSource
    class BlockCypher < Ryp::DataSource::Base
      attr_reader :network

      def initialize(network)
        @network = network
      end

      def address(content)
        get("v1/#{network}/main/addrs/#{content.value}")
      end

      def transaction(content)
        get("v1/#{network}/main/txs/#{content.value}")
      end

      def data_host
        'https://api.blockcypher.com'
      end
    end
  end
end
