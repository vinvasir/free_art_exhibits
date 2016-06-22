# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'free_art_exhibits/version'

Gem::Specification.new do |spec|
  spec.name          = "free-art-exhibits-cli-gem"
  spec.version       = FreeArtExhibits::VERSION
  spec.authors       = ["Prateek Vasireddy"]
  spec.email         = ["prat.vasireddy@gmail.com"]

  spec.summary       = %q{Exhibits NYC.}
  spec.description   = %q{Free art exhibits in NYC.}
  spec.homepage      = "http://rubygems.org/gems/free-art-exhibits-cli-gem"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['free-art-exhibits']
  spec.require_paths = ["lib", "lib/free_art_exhibits"]

  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  #spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"  
end
