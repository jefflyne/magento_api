require 'xmlrpc/client'

require 'magento-rpc/configuration'
require 'magento-rpc/extensions'
require "magento-rpc/version"

require 'magento-rpc/abstract'
require 'magento-rpc/catalog_category'
require 'magento-rpc/catalog_product'
require 'magento-rpc/catalog_product_attribute'
require 'magento-rpc/catalog_product_attribute_media'
require 'magento-rpc/catalog_inventory_stock_item'


XMLRPC::Config.const_set(:ENABLE_NIL_PARSER, true)


module Magento
  class Connection
    MAX_RETRIES = 5
    BACKOFF_FACTOR = 5
    TIMEOUT = 60


    def initialize
      @config = Configuration.instance
      @client = XMLRPC::Client.new(@config.host, @config.path, @config.port)
      @client.timeout = TIMEOUT
      process_request do
        @session = @client.call('login', @config.username, @config.api_key)
      end
      self
    end

    def call(method = nil, args)
      process_request do
        @client.call('call', @session, method, args)
      end
    end

    def process_request
      retry_count = 0

      begin
        return yield
      rescue => e
        case e
        when EOFError, Timeout::Error then
          raise e if retry_count == MAX_RETRIES
          retry_count+=1
          sleep(retry_count * BACKOFF_FACTOR)
          retry
        else
          raise e
        end
      end
    end
  end
end
