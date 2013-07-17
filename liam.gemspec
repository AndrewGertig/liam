# coding: utf-8
require File.expand_path('../lib/liam/version.rb', __FILE__)

# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'liam/version'

Gem::Specification.new do |spec|
  spec.name          = "liam"
  spec.version       = Liam::VERSION
  spec.authors       = ["AndrewGertig"]
  spec.email         = ["andrew.gertig@gmail.com"]
  spec.description   = "A RubyMotion gem that provides some cool buttons borrowed from some smart people."
  spec.summary       = "A RubyMotion gem that borrows heavily from some cool buttons."
  spec.homepage      = "https://github.com/AndrewGertig/liam"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end