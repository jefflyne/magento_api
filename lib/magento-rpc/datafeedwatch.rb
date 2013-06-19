module Magento
  class DataFeedWatch < Abstract
    def self.version(*args)
      return call('datafeedwatch.version', args)
    end
    def self.products(*args)
      return call('datafeedwatch.products', args)
    end
    def self.product_count(*args)
      return call('datafeedwatch.product_count', args)
    end
  end
end
