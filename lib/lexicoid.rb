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
  # The Time instance representing the time at the beginning of the Unix epoch
  #
  # @api private
  # @private
  EPOCH = Time.at(0).utc.freeze

  # The alphabet for encoding lexicographic base32 IDs
  #
  # @api private
  # @private
  LEXICOGRAPHIC_BASE32 = "234567abcdefghijklmnopqrstuvwxyz"

  # Converts a timestamp into a lexicographically sortable, friendly ID
  #
  # @api public
  # @since 0.1.0
  #
  # @example Generate a lexicoid from a DateTime
  #   Lexicoid.from DateTime.parse("2023-03-19T21:19:50-05:00")
  #
  # @example Generate a lexicoid from a Float timestamp
  #   Lexicoid.from 2_147_483_647.0
  #
  # @example Generate a lexicoid from an Integer timestamp
  #   Lexicoid.from 946_684_799
  #
  # @example Generate a lexicoid from a Time
  #   Lexicoid.from Time.parse("2023-03-19 15:06:14.48414 -0500")
  #
  # @example Generate a lexicoid in a Rails application
  #   Lexicoid.from 2.weeks.ago
  #
  # @param number_or_time [ActiveSupport::TimeWithZone, DateTime, Float, Integer, Time, #to_time]
  #   the object to convert into a lexicographically sorting friendly ID
  # @return [String] the friendly ID
  # @raise [ArgumentError] when the object is unsuitable for conversion
  def self.from(number_or_time)
    number = maybe_coerce_time(number_or_time)
    bytes = bytes_from_number(number)
    buffer = encode(bytes)

    buffer.join
  end

  # Generates a lexicographically sortable, friendly ID from the current time
  #
  # @api public
  # @since 0.1.0
  #
  # @example Generate a friendly ID for the current moment
  #   Lexicoid.now
  #
  # @return [String] the friendly ID
  def self.now
    from Time.now
  end

  # Extracts the bytes from a number in big endian order
  #
  # @api private
  # @private
  #
  # @param number [Integer] the number to extract bytes from
  # @return [Array<Integer>] the bytes from the number as integers in big endian
  #   order
  private_class_method def self.bytes_from_number(number)
    [].tap do |bytes|
      bytes.unshift(0) and next if number.zero?

      while number.positive?
        bytes.unshift(number & 0xFF)
        number >>= 8
      end
    end
  end

  # Encodes a byte array into a lexicographically sortable array of characters
  #
  # @api private
  # @private
  #
  # @param bytes [Array<Integer>] the bytes to encode, in big endian order
  # @return [Array<String>] the bytes encoded to the lexicographic base32 alphabet
  private_class_method def self.encode(bytes)
    result = Array.new((bytes.length * 8 + 4) / 5, 0)
    offset = 0

    while bytes.length.positive?
      length = bytes.length
      buffer =
        case length
        when 1, 2 then Array.new(bytes.length * 2, 0)
        when 3, 4 then Array.new(bytes.length * 2 - 1, 0)
        else Array.new(8, 0)
        end

      if length > 4
        buffer[7] = bytes[4] & 0x1F
        buffer[6] = bytes[4] >> 5
      end

      if length >= 4
        buffer[6] |= (bytes[3] << 3) & 0x1F
        buffer[5] = (bytes[3] >> 2) & 0x1F
        buffer[4] = bytes[3] >> 7
      end

      if length >= 3
        buffer[4] |= (bytes[2] << 1) & 0x1F
        buffer[3] = (bytes[2] >> 4) & 0x1F
      end

      if length >= 2
        buffer[3] |= (bytes[1] << 4) & 0x1F
        buffer[2] = (bytes[1] >> 1) & 0x1F
        buffer[1] = (bytes[1] >> 6) & 0x1F
      end

      if length >= 1
        buffer[1] |= (bytes[0] << 2) & 0x1F
        buffer[0] = bytes[0] >> 3
      end

      buffer.each_with_index do |byte, i|
        result[i + offset] = LEXICOGRAPHIC_BASE32[byte & 31]
      end

      break if bytes.length < 5

      bytes = bytes[5..]
      offset += 8
    end

    result
  end

  # Validates and coerces an argument for suitability for conversion
  #
  # @api private
  # @private
  #
  # @param object [Object] the object to validate and coerce
  # @return [Integer] the object converted into an integer timestamp
  # @raise [ArgumentError] when the object is unsuitable for conversion
  private_class_method def self.maybe_coerce_time(object)
    if object.is_a?(Integer) || object.is_a?(Float)
      raise ArgumentError, "#{object} must be non-negative" if object.negative?
      object.to_i
    elsif object.is_a?(Time)
      raise ArgumentError, "#{object.iso8601} must be after #{EPOCH.iso8601}" unless EPOCH <= object
      object.to_i
    elsif object.respond_to?(:to_time)
      maybe_coerce_time object.to_time
    else
      raise(
        ArgumentError,
        "#{object.inspect} must be one of Integer, Float, Time, or respond to `#to_time'"
      )
    end
  end
end

require_relative "core_ext/kernel"
