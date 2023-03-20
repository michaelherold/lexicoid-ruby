# frozen_string_literal: true

# The `Kernel` module is included by class `Object`, so its methods are available in every Ruby object.
#
# @see https://ruby-doc.org/current/Kernel.html
module Kernel
  private

  # Returns a lexicographically sortable friendly ID for a timestamp
  #
  # @api public
  # @since 0.1.0
  # @!visibility public
  #
  # @example Converts a post's created-at timestamp to a friendly ID
  #   Post = Struct.new(:created_at, keyword_init: true)
  #   post = Post.new(created_at: Time.parse("2023-03-19 14:33:01.80251 -0500"))
  #
  #   Lexicoid(post.created_at) #=> "gkfqavc"
  #
  # @param object [ActiveSupport::TimeWithZone, DateTime, Float, Integer, Time, #to_time]
  #   the object to convert into a lexicographically sorting friendly ID
  # @param exception [Boolean] raises an ArgumentError when the argument is
  #   improper and this is true, otherwise an improper argument leads to an empty string
  # @return [String] the friendly ID
  # @raise [ArgumentError] when the object is not a timestamp-like one
  def Lexicoid(object, exception: true)
    Lexicoid.from(object)
  rescue ArgumentError
    raise if exception
    ""
  end
end
