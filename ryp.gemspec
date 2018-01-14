
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ryp/version"

Gem::Specification.new do |spec|
  spec.name          = "ryp"
  spec.version       = Ryp::VERSION
  spec.authors       = ["Matthew Werner"]
  spec.email         = ["m@mjw.io"]

  spec.summary       = %q{Cryptocurrency Tooling CLI}
  spec.description   = %q{Tools you can use on the command line to investigate cryptocurrency}
  spec.homepage      = "https://github.com/mwerner/ryp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "faye-websocket"
  spec.add_dependency "faraday"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "dotenv"
end
