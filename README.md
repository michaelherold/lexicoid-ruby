# Lexicoid for Ruby

Have you ever needed to convert a timestamp into something short, memorable, easy to look at, and easy to type? Look no further! You want a "lexicoid."

Inspired by [Brandur Leach](https://brandur.org/fragments/base32-slugs), Lexicoid for Ruby gives you lexicographically sortable, time-based identifiers that are easy to read and easy to type; perfect for using in URLs and other places that take human input.

Use lexicoids for anywhere that you have a timestamp that operates on "human scale" … think microblog status identifiers or URL-encoded timestamps. Avoid them for distributed systems; instead, consider something like [KSUID](https://github.com/michaelherold/ksuid-ruby) for that use case.

## Installation

Install the gem and add it to the application's Gemfile by executing:

    $ bundle add lexicoid

If you are not using Bundler to manage dependencies, install the gem by executing:

    $ gem install lexicoid

## Usage

Generate a lexical identifier for the current moment:

```ruby
Lexicoid.now
```

Convert any time-related object to a lexical identifier:

```ruby
# Integer
Lexicoid.from(1_678_767_177)

# Float
Lexicoid.from(1_678_767_285.293477)

# Time
Lexicoid.from(Time.now)

# DateTime
Lexicoid.from(DateTime.now)

# ActiveSupport::TimeWithZone
Lexicoid.from(2.weeks.ago)
```

There is also a `Kernel` method available for converting objects to lexicoids:

```ruby
Lexicoid(Time.now)

Lexicoid("oops") #=> raises ArgumentError

Lexicoid("oops", exception: false) #=> ""
```

## Contributing

So you're interested in contributing to Lexicoid? Check out our [contributing guidelines](CONTRIBUTING.md) for more information on how to do that.

## Supported Ruby Versions

This library aims to support and is [tested against](https://github.com/michaelherold/lexicoid-ruby/actions) the following Ruby versions:

* Ruby 3.0
* Ruby 3.1
* Ruby 3.2

If something doesn't work on one of these versions, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby versions, however we will only provide support for the versions listed above.

If you would like this library to support another Ruby version or implementation, you may volunteer to be a maintainer. Being a maintainer entails making sure all tests run and pass on that implementation. When something breaks on your implementation, you will be responsible for providing patches in a timely fashion. If critical issues for a particular implementation exist at the time of a major release, we may drop support for that Ruby version.

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html). Report violations of this scheme should as bugs. Specifically, if a minor or patch version breaks backward compatibility, that version should be immediately yanked and/or a new version should be immediately released that restores compatibility. Only new major versions will introduce breaking changes to the public API. As a result of this policy, you can (and should) specify a dependency on this gem using the [pessimistic version constraint](http://guides.rubygems.org/patterns/#pessimistic-version-constraint) with two digits of precision. For example:

    spec.add_dependency "lexicoid", "~> 0.1"

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

We expect everyone interacting in the Lexicoid for Ruby project's codebases, issue trackers, chat rooms and mailing lists to follow the [code of conduct](https://github.com/michaelherold/lexicoid/blob/main/CODE_OF_CONDUCT.md).

## Acknowledgments

[Brandur Leach](https://brandur.org/fragments/base32-slugs) wrote about the concept behind this gem and inspired its creation.

[Luciano Mammino](https://loige.co/) took the first step, created a [Rust crate](https://crates.io/crates/lexicoid) and came up with the [excellent name](https://github.com/lmammino/lexicoid) for these identifiers.
