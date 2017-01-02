# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zipfy/version'

Gem::Specification.new do |spec|
  spec.name          = "zipfy"
  spec.version       = Zipfy::VERSION
  spec.authors       = ["bjubes"]
  spec.email         = ["brian2386@gmail.com"]

  spec.summary       = "Zipfy calculates word distribution in text files or strings and their deviation from Zipf's law"
  spec.homepage      = "https://github.com/bjubes/ziphy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["zipfy"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'putsplus'
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
