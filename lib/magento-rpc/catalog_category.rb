module Magento
  class CatalogCategory < Abstract
    def self.tree(*args)
      return call('catalog_category.tree', args)
    end

    def self.info(*args)
      return call('catalog_category.info', args)
    end
  end
end
