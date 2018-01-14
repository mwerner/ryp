module Ryp
  class Block
    attr_reader :hash, :weight, :height, :size, :age, :timestamp

    def initialize(attrs = {})
      @hash = attrs[:hash]
      @weight = attrs[:weight]
      @height = attrs[:height]
      @size = attrs[:size]
      @age = attrs[:age]
      @timestamp = attrs[:timestamp]
    end
  end
end
