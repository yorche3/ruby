# frozen_string_literal: true

require_relative "lib/data_structures_basics/version"

Gem::Specification.new do |spec|
  spec.name          = "data_structures_basics"
  spec.version       = DataStructuresBasics::VERSION
  spec.authors       = ["yorche3"]
  spec.email         = ["hyaoki123@gmail.com"]
  spec.summary       = "Basic linked data structures built from scratch"
  spec.license       = "GPL-3.0-or-later"
  spec.required_ruby_version = ">= 3.0"
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
end
