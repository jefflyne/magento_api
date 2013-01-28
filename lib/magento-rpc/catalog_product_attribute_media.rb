module Magento
  class CatalogProductAttributeMedia < Abstract
    def self.list(*args)
      return call('catalog_product_attribute_media.list', args)
    end

    def self.info(*args)
      return call('catalog_product_attribute_media.info', args)
    end
  end
end
