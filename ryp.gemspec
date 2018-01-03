# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ryp/version"

Gem::Specification.new do |spec|
  spec.name          = "ryp"
  spec.version       = Ryp::VERSION
  spec.authors       = ["Matthew Werner"]
  spec.email         = ["matthew@coinbase.com"]

  spec.summary       = %q{Quick access cryptocurrency tools}
  spec.description   = %q{Get information about cryptocurrency from the command line}
  spec.homepage      = "https://github.com/mwerner/ryp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'faraday'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
