module Magento
  class Product < Abstract
    def self.list(*args)
      connect
      products = @connection.call('product.list',args)
      product_list = []

      products.each do |product|
        product_list.push(product.to_struct(self.class.to_s))
      end

      return product_list
    end
  end
end
