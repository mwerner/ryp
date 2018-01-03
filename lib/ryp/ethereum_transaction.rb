module Ryp
  class EthereumTransaction < Ryp::Resource

    # https://www.blockcypher.com/dev/ethereum/#transaction
    def self.data_map
      {
        hash: 'hash',
        height: 'block_height',
        total: 'total',
        fees: 'fees',
        size: 'size',
        received_at: 'received',
        confirmed_at: 'confirmed',
        confirmations: 'confirmations',
        gas_used: 'gas_used',
        gas_price: 'gas_price'
      }
    end
    attr_reader *data_map.keys

    def hash
      "0x#{@hash}"
    end

    def total
      @total / 1e18
    end

    def fees
      @fees / 1e18
    end

    def url
      "https://etherscan.io/tx/#{hash}"
    end
  end
end
