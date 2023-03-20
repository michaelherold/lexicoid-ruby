# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/michaelherold/lexicoid-ruby/tree/main)

### Added

- Converting timestamps in the form of `Integer`s, `Float`s, `Time`s, `DateTime`s, and anything responding to `#to_date`, including `ActiveSupport::TimeWithZone` via `Lexicoid.from`.
- Generating the lexicoid for the current moment with `Lexicoid.now`.
- Converting timestamps with the `Kernel#Lexicoid` method, with optional exception squelching via `Lexicoid(Time.now, exception: false)`.
