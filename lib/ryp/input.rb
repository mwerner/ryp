module Ryp
  class Input
    attr_reader :sequence, :output, :script

    def initialize(attrs = {})
      @sequence = attrs[:sequence]
      @output = attrs[:output]
      @script = attrs[:script]
    end
  end
end
