require 'yaml'


module Magento
  class Configuration
    attr_accessor :username, :api_key, :host, :path, :port

    private_class_method :new
    @@instance = nil

    def self.instance(credentials=nil)
      if !credentials.nil? or @@instance.nil?
        @@instance = new(credentials)
      end

      return @@instance
    end

    @@config_path = File.dirname(__FILE__) + "/../config/magento.yml"

    def self.config_path=(path)
      @@config_path = path
    end

    def initialize(credentials=nil)
      if credentials.nil?
        raise ConfigurationException, "Missing configuration file" unless File.exists?(@@config_path)
        credentials = YAML.load_file(@@config_path)
      else
        if credentials.instance_of?(Hash)
          ['username','api_key','host'].each do |key|
            raise ConfigurationException, "Credentials missing #{key}" unless credentials.key?(key)
          end
        else
          raise ConfigurationException, 'Credentials is not instance of Hash'
        end
      end

      @username = credentials['username']
      @api_key  = credentials['api_key']
      @host     = credentials['host']
      @path     = credentials['path'] || '/api/xmlrpc'
      @port     = credentials['port'] || '80'
      yield self if block_given?
    end
  end

  class ConfigurationException < StandardError; end;
end
