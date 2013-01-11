module Magento
  class Product < Abstract
    def self.list(*args)
      # ensure we are connected
      connect
      # return products in array, every product is a hash
      return @connection.call('product.list',args)
    end
  end
end
