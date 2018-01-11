# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aokay/version'

Gem::Specification.new do |spec|
  spec.name          = "aokay"
  spec.version       = Aokay::VERSION
  spec.authors       = ["Haiku team"]
  spec.email         = ["skyhaikuteam@gmail.com"]
  spec.summary       = %q{ Helps you to write tests which verify Omniture requests are made correctly. }
  spec.description   = %q{ Helps you to write tests which verify Omniture requests are made correctly. } 
  spec.homepage      = ""
  spec.license       = "NA"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "rspec", "~> 3"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "addressable"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "poltergeist"
  spec.add_development_dependency "coveralls"
end
