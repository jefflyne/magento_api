module Magento
  class CatalogProductAttribute < Abstract
    def self.list(*args)
      return call('catalog_product_attribute.list', args)
    end

    def self.info(*args)
      return call('catalog_product_attribute.info', args)
    end

    def self.options(*args)
      return call('catalog_product_attribute.options', args)
    end

    def self.types(*args)
      return call('catalog_product_attribute.types', args)
    end
  end
end
