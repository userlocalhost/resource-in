# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resource_in/version'

Gem::Specification.new do |spec|
  spec.name          = "resource_in"
  spec.version       = ResourceIn::VERSION
  spec.authors       = ["Hiroyasu OHYAMA"]
  spec.email         = ["user.localhost2000@gmail.com"]

  spec.summary       = %q{This integrates IT resources.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/userlocalhost2000/resource-in"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "terminal-table", "1.5.2"
  spec.add_runtime_dependency "colorize", "0.7.7"
  spec.add_runtime_dependency "dl_racktables", "~> 0.0.1"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
