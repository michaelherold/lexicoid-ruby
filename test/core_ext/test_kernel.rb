# frozen_string_literal: true

require "test_helper"

class TestKernel < Minitest::Test
  def test_kernel_method_can_squelch_errors
    assert_raises(ArgumentError) { Lexicoid("oops") }
    assert_equal "", Lexicoid("oops", exception: false)
  end

  def test_kernel_method_is_private_on_objects
    assert_raises(NoMethodError) { Object.new.Lexicoid(Time.now) }
  end
end
