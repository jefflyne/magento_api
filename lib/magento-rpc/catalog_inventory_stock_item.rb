module Magento
  class CatalogInventoryStockItem < Abstract
    def self.list(*args)
      return call('cataloginventory_stock_item.list', args)
    end
  end
end
