# frozen_string_literal: true

require_relative "lexicoid/version"

# Generates lexicographically sortable, friendly IDs from timestamps
#
# A "lexicoid" is a short identifier derived from a timestamp for use in single
# source streaming systems. They are based on an [approach for giving friendly
# URLs to microblog posts, by Brandur Leach][1].
#
# In order to make them easy to use, lexicoids have the following properties:
#
# 1. They are lexicographically, i.e. alphabetically, sortable by time to the
#    second.
# 2. They encode to lower case letters for easier typing into a URL.
# 3. Their alphabet eliminates easily-confused letter combinations like `1`,
#    `l`, and `I`, or `0` and `O`.
#
# At their heart, lexicoids are a special case of [Base 32 encoding][2] for
# integers.
#
# Their properties makes them ideally suitable to human-scale use cases, like
# microblog post slugs or URL-encoded timestamps. They are poorly suited for
# distributed systems with multiple clocks or systems that generate items at a
# rate of more than one per second, regardless of the number of clocks.
#
# [1]: https://brandur.org/fragments/base32-slugs
# [2]: https://datatracker.ietf.org/doc/html/rfc4648
module Lexicoid
end
