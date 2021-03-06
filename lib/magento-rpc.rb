require 'xmlrpc/client'

require 'magento-rpc/configuration'
require 'magento-rpc/extensions'
require "magento-rpc/version"

require 'magento-rpc/abstract'
require 'magento-rpc/datafeedwatch'
require 'magento-rpc/catalog_category'
require 'magento-rpc/catalog_product'
require 'magento-rpc/catalog_product_attribute'
require 'magento-rpc/catalog_product_attribute_media'
require 'magento-rpc/catalog_inventory_stock_item'


XMLRPC::Config.send(:const_set, :ENABLE_NIL_PARSER, true)


module Magento
  class Connection
    MAX_RETRIES = 5
    BACKOFF_FACTOR = 5
    TIMEOUT = 300

    private_class_method :new
    @@instance = nil

    def self.instance()
      if @@instance.nil?
        @@instance = new
      end

      return @@instance
    end

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
      response = nil

      process_request do
        response = @client.call('call', @session, method, args)
      end

      return response
    end

    def process_request
      retry_count = 0

      begin
        return yield
      rescue => e
        case e
        when EOFError, Timeout::Error, Errno::EPIPE, Errno::ECONNRESET then
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
