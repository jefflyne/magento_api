require 'xmlrpc/client'

require 'magento-rpc/configuration'
require 'magento-rpc/extensions'
require "magento-rpc/version"

require 'magento-rpc/abstract'
require 'magento-rpc/catalog_category'
require 'magento-rpc/catalog_product'
require 'magento-rpc/catalog_product_attribute_media'


XMLRPC::Config.const_set(:ENABLE_NIL_PARSER, true)


module Magento
  class Connection
    def initialize
      @config = Configuration.instance
      @client = XMLRPC::Client.new(@config.host, @config.path, @config.port)
      @session = @client.call('login', @config.username, @config.api_key)
      self
    end

    def call(method = nil, args)
      @client.call('call', @session, method, args)
    end
  end
end
