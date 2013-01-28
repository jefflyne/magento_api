module Magento
  class CatalogProduct < Abstract
    def self.list(*args)
      return call('catalog_product.list', args)
    end

    def self.info(*args)
      return call('catalog_product.info', args)
    end
  end
end
