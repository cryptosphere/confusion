# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'confusion/version'

Gem::Specification.new do |spec|
  spec.name          = 'confusion'
  spec.version       = Confusion::VERSION
  spec.authors       = ['Tony Arcieri']
  spec.email         = ['bascule@gmail.com']
  spec.description   = 'An experiment in unlinkable messaging'
  spec.summary       = 'Confusion is an experimental messaging system for unlinkable rendezvous'
  spec.homepage      = 'https://github.com/cryptosphere/confusion'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'reel-rack'
  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'secure_headers'
  spec.add_runtime_dependency 'rbnacl'
  spec.add_runtime_dependency 'base32'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
end
