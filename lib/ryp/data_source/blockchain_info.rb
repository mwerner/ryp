module Ryp
  module DataSource
    class BlockchainInfo < Ryp::DataSource::Base
      def address(content)
        get("rawaddr/#{content.value}")
      end

      def transaction(content)
        get("rawtx/#{content.value}")
      end

      def data_host
        'https://blockchain.info'
      end
    end
  end
end
