require 'faraday'
require 'json'

module Ryp
  module DataSource
    class Base
      def get(path)
        response = connection.get(path)
        if response.status != 200
          raise BadResponseError, "#{response.status} response from server: #{response.body}"
        end

        JSON.parse(response.body)
      end

      def connection
        @connection ||= Faraday.new(data_host)
      end

      def data_host
        # Implemented in subclasses
      end
    end
  end
end
