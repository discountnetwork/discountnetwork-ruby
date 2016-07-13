# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'discountnetwork/version'

Gem::Specification.new do |spec|
  spec.name          = "discountnetwork"
  spec.version       = Discountnetwork::VERSION
  spec.authors       = ["Abu Nashir"]
  spec.email         = ["abunashir@gmail.com"]

  spec.summary       = %q{A Ruby interface to the Discount Network API}
  spec.description   = %q{A Ruby interface to the Discount Network API}
  spec.homepage      = "https://github.com/discountnetwork/discountnetwork-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
