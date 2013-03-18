module Magento
  class Abstract
    attr_accessor :attributes

    def initialize(attributes = {})
      @connection = Magento::Connection.instance()
      @attributes = attributes.dup
    end

    def self.call(method, args)
      self.connect.call(method, args)
    end

    def self.first
      return nil unless respond_to?(:list)
      n = 0
      while list(n)[0] == nil
        n+=1
      end
      return list(n)[0]
    end

    def object_attributes=(new_attributes)
      return if new_attributes.nil?
      attributes = new_attributes.dup
      attributes.stringify_keys!
      attributes.each do |k, v|
        send(k + "=", v)
      end
    end

    def self.commit(method, *args)
      connect
      @connection.call(method, args)
    end

    def method_missing(method, *args)
      return nil unless @attributes
      @attributes[method.to_s]
    end

    private

    def self.connect
      @connection ||= Magento::Connection.instance()
    end
  end
end
