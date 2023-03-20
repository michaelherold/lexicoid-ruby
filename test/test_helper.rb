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

require "lexicoid"

Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(
    color: true
  )
]
