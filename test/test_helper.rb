# frozen_string_literal: true

if ENV["CI"] || ENV["COVERAGE"]
  require "simplecov"

  SimpleCov.start do
    add_filter "/test/"
  end

  SimpleCov.command_name "test:unit"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "minitest/reporters"
require "pry"
require "pry-byebug"
require "time"

require "active_support"
require "active_support/core_ext/integer/time"
require "active_support/core_ext/time"
require "active_support/time_with_zone"

require "lexicoid"

Time.zone = "UTC"

# Remove this when bumping to ActiveSupport 7.1
ActiveSupport::TimeWithZone.singleton_class.remove_method(:name)

Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(
    color: true
  )
]
