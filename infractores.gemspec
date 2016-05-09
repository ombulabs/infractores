# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infractores/version'

Gem::Specification.new do |spec|
  spec.name          = "infractores"
  spec.version       = Infractores::VERSION
  spec.authors       = ["Ernesto Tagwerker", "Mauro Otonelli"]
  spec.email         = ["ernesto+github@ombulabs.com", "mauro.otonelli@gmail.com"]

  spec.summary       = %q{Track parking violations reported via Twitter}
  spec.description   = %q{Track any kind of violations via Twitter with a geolocated tweet}
  spec.homepage      = "https://github.com/ombulabs/infractores"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
