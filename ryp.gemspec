
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ryp/version"

Gem::Specification.new do |spec|
  spec.name          = "ryp"
  spec.version       = Ryp::VERSION
  spec.authors       = ["Matthew Werner"]
  spec.email         = ["m@mjw.io"]

  spec.summary       = %q{Cryptocurrency Tooling CLI}
  spec.description   = %q{Tools you can use on the command line to investigate a cryptocurrency}
  spec.homepage      = "https://github.com/mwerner/ryp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
