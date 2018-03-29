
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bip21/version"

Gem::Specification.new do |spec|
  spec.name          = "bip21"
  spec.version       = Bip21::VERSION
  spec.authors       = ["Adam Plánský"]
  spec.email         = ["adamplansky@gmail.com"]

  spec.summary       = %q{BIP21 implementation}
  spec.description   = %q{Simple script that generates BIP21 URI scheme. More detailed description can be found: https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki}
  spec.homepage      = "https://github.com/adamplansky/bip21"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

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
