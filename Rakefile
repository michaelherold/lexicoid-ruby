# frozen_string_literal: true

require "bundler/gem_tasks"
require "inch/rake"
require "rake/testtask"
require "standard/rake"

Inch::Rake::Suggest.new(:inch)

Rake::TestTask.new(:test) do |t|
  t.libs.concat(["lib", "test"])
  t.test_files = FileList["test/**/test_*.rb"]
end

task default: ["test", "standard:fix", "inch"]
