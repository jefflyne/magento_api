# -*- encoding: utf-8 -*-
require File.expand_path('../lib/magento-rpc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Hoeg"]
  gem.email         = ["peter@speartail.com"]
  gem.description   = %q{Enables connecting to a Magento Store via their API}
  gem.summary       = %q{Enables connecting to a Magento Store via their API}
  gem.homepage      = "http://peterhoeg.github.com/ruby-magento"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "magento-rpc"
  gem.require_paths = ["lib"]
  gem.version       = Magento::RPC::VERSION

  gem.add_dependency 'rake'

  gem.add_development_dependency 'rspec'
end
