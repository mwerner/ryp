module Ryp
  class Output
    attr_reader :index, :type, :addr, :value, :n, :script, :spent

    def initialize(attrs={})
      @index = attrs[:index]
      @type = attrs[:type]
      @addr = attrs[:addr]
      @value = attrs[:value]
      @n = attrs[:n]
      @script = attrs[:script]
      @spent = attrs[:spent] == true
    end
  end
end
