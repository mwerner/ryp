module Ryp
  class BitcoinTransaction < Ryp::Resource

    # https://www.blockcypher.com/dev/bitcoin/#transaction-hash-endpoint
    def self.data_map
      {
        hash: 'hash',
        height: 'block_height',
        total: 'total',
        fees: 'fees',
        size: 'size',
        received_at: 'received',
        confirmed_at: 'confirmed',
        confirmations: 'confirmations'
      }
    end
    attr_reader *data_map.keys

    def total
      @total / 1e8
    end

    def fees
      @fees / 1e8
    end

    def url
      "https://blockchain.info/tx/#{hash}"
    end
  end
end
