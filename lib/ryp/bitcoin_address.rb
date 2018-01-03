module Ryp
  class BitcoinAddress < Ryp::Resource

    # https://www.blockcypher.com/dev/bitcoin/#address-balance-endpoint
    def self.data_map
      {
        address: 'address',
        total_received: 'total_received',
        total_sent: 'total_sent',
        balance: 'balance',
        unconfirmed_balance: 'unconfirmed_balance',
        transaction_count: 'n_tx',
        unconfirmed_transaction_count: 'unconfirmed_n_tx',
      }
    end
    attr_reader *data_map.keys

    def total_received
      @total_received.to_i / 1e8
    end

    def total_sent
      @total_sent.to_i / 1e8
    end

    def balance
      @balance.to_i / 1e8
    end

    def unconfirmed_balance
      @unconfirmed_balance.to_i / 1e8
    end

    def url
      "https://blockchain.info/address/#{address}"
    end
  end
end
