# frozen_string_literal: true

require_relative "lib/kubik_structured_data/version"

Gem::Specification.new do |spec|
  spec.name = "kubik_structured_data"
  spec.version = KubikStructuredData::VERSION
  spec.authors = ["Primate"]
  spec.email = ["bart@primate.co.uk"]

  spec.summary = "Schema.org JSON-LD for Kubik CMS"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.files = Dir.chdir(__dir__) { Dir["{app,lib}/**/*", "*.gemspec", "README.md"] }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "schema_dot_org", ">= 2.5"
end
