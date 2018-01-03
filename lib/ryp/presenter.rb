module Ryp
  class Presenter
    attr_reader :network

    def initialize(network)
      @network = network
    end

    def present(content)
      puts "#{content.type.capitalize} on #{network.upcase}:\n\n"
      data = content.data.to_h
      url = data.delete(:url)
      pretty_print data
      puts "\n#{url}"
    end

    private

    def pretty_print(object)
      if object.is_a?(Hash)
        object.each_pair do |key, value|
          if value.is_a?(Array)
            attribute = key.to_s.gsub(/-|_/, ' ').capitalize
            puts ["#{attribute}:", value.map{|v| "  - #{v}"}].join("\n")
          else
            attribute = key.to_s.gsub(/-|_/, ' ').capitalize
            puts "#{attribute.ljust(25)}: #{value}"
          end
        end
      elsif object.is_a?(Array)
        object.each { |n| puts n }
      else
        puts object
      end
    end
  end
end
