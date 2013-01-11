require 'xmlrpc/client'

require 'magento-rpc/abstract'
require 'magento-rpc/category'
require 'magento-rpc/configuration'
require 'magento-rpc/country'
require 'magento-rpc/customer_address'
require 'magento-rpc/customer_groups'
require 'magento-rpc/customer'
require 'magento-rpc/error'
require 'magento-rpc/extensions'
require 'magento-rpc/inventory'
require 'magento-rpc/invoice'
require 'magento-rpc/order'
require 'magento-rpc/product_images'
require 'magento-rpc/product'
require 'magento-rpc/product_types'
require 'magento-rpc/region'
require 'magento-rpc/server'
require 'magento-rpc/shipment'
require "magento-rpc/version"

XMLRPC::Config.const_set(:ENABLE_NIL_PARSER, true)


module Magento
  class Connection
    attr_accessor :client

    def initialize(*args)
      @config = Configuration.new
      @client = XMLRPC::Client.new(@config.host, @config.path, @config.port)
      @session = @client.call("login", @config.username, @config.api_key)
      self
    end

    def call(method = nil, *args)
      client.call("call", @session, method, args)
    end
  end
end
