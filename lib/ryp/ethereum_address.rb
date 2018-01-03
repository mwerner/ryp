module Ryp
  class EthereumAddress < Ryp::Resource

    # https://www.blockcypher.com/dev/ethereum/#address
    def self.data_map
      {
        address: 'address',
        total_received: 'total_received',
        total_sent: 'total_sent',
        balance: 'balance',
        unconfirmed_balance: 'unconfirmed_balance',
        transaction_count: 'n_tx',
        unconfirmed_transaction_count: 'unconfirmed_n_tx'
      }
    end
    attr_reader *data_map.keys

    def hash
      "0x#{@hash}"
    end

    def total_received
      @total_received.to_i / 1e18
    end

    def total_sent
      @total_sent.to_i / 1e18
    end

    def balance
      @balance.to_i / 1e18
    end

    def unconfirmed_balance
      @unconfirmed_balance.to_i / 1e18
    end

    def url
      "https://etherscan.io/address/0x#{address}"
    end
  end
end
