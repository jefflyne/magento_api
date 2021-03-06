# Magento::RPC

This is a simple gem which wraps Magento XML-RPC calls with Ruby classes.

It is based on Tim Matheson's hard work.

This allows for you to integrate your Magento Shopping Cart into ruby applications.

The full Magento Core Api is available at http://www.magentocommerce.com/support/magento_core_api

The current supported resources are:

* Category
* Country
* Customer
* CustomerAddress
* CustomerGroups
* Inventory
* Invoice
* Order
* Product
* ProductImages
* ProductTypes
* Region
* Shipment

## Installation

Add this line to your application's Gemfile:

    gem 'magento-rpc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magento-rpc

## Usage

Edit config/config.yml and add your magento api username and api key to the file.

Get a single customer with an ID of 1 (all attributes are available now as array indexes)
    customer = Magento::Customer.find("1")
    customer['firstname'] => "Tim"
    customer['lastname'] => "Matheson"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Issues

There was previously an issue with "wrong/unknown XML-RPC type 'nil'"
This should however be fixed but do shout if that is not the case.
