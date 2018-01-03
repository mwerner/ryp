module Ryp
  class Resource
    attr_reader :raw

    def parse!(data)
      self.class.data_map.each_pair do |attribute, key|
        instance_variable_set("@#{attribute}", data[key])
      end
      @raw = data
    end

    def attributes
      Hash.new.tap do |attributes|
        self.class.data_map.keys.each do |attribute|
          attributes[attribute] = send(attribute)
        end
      end
    end

    def to_h
      { url: url }.merge(attributes)
    end
  end
end
