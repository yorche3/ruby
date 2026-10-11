# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "numbers"
  spec.version       = "0.1.0"
  spec.authors       = ["yorche3"]
  spec.email         = ["hyaoki123@gmail.com"]
  spec.summary       = "Numeric algorithms: recursive, accumulator and iterative"
  spec.license       = "GPL-3.0-or-later"
  spec.required_ruby_version = ">= 3.0"
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
end
