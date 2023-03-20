# frozen_string_literal: true

require_relative "lib/lexicoid/version"

Gem::Specification.new do |spec|
  spec.name = "lexicoid"
  spec.version = Lexicoid::VERSION
  spec.authors = ["Michael Herold"]
  spec.email = ["opensource@michaeljherold.com"]

  spec.summary = "Short and stable IDs from timestamps"
  spec.description = spec.summary
  spec.homepage = "https://github.com/michaelherold/lexicoid-ruby"
  spec.license = "MIT"

  spec.files = %w[CHANGELOG.md CONTRIBUTING.md LICENSE.md README.md]
  spec.files += %w[lexicoid.gemspec]
  spec.files += Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0.0"

  spec.add_development_dependency "bundler", ">= 2"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/michaelherold/lexicoid-ruby/issues",
    "changelog_uri" => "https://github.com/michaelherold/lexicoid-ruby/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://rubydoc.info/gems/lexicoid-ruby/#{Lexicoid::VERSION}",
    "homepage_uri" => "https://github.com/michaelherold/lexicoid-ruby",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/michaelherold/lexicoid-ruby"
  }
end
