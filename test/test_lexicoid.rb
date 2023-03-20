# frozen_string_literal: true

require "test_helper"

class TestLexicoid < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Lexicoid::VERSION
  end

  def test_from_with_integers
    assert_equal "22", Lexicoid.from(0)               # Thu Jan 01 1970 00:00:00 -0000
    assert_equal "gk", Lexicoid.from(100)             # Thu Jan 01 1970 00:01:40 -0000
    assert_equal "6wc2", Lexicoid.from(10000)         # Thu Jan 01 1970 02:46:40 -0000
    assert_equal "2ykm2", Lexicoid.from(500000)       # Tue Jan 06 1970 18:53:20 -0000
    assert_equal "5bse2", Lexicoid.from(1700000)      # Tue Jan 20 1970 16:13:20 -0000
    assert_equal "2apny22", Lexicoid.from(28000000)   # Sat Nov 21 1970 01:46:40 -0000
    assert_equal "6567f22", Lexicoid.from(550000000)  # Sat Jun 06 1987 17:46:40 -0000
    assert_equal "flllz22", Lexicoid.from(1550000000) # Tue Feb 12 2019 19:33:20 -0000
    assert_equal "gehebv2", Lexicoid.from(1654301676) # Sat Jun 04 2022 00:14:36 -0000
    assert_equal "gei4p52", Lexicoid.from(1654401676) # Sun Jun 05 2022 04:01:16 -0000
    assert_equal "gj7x3v2", Lexicoid.from(1674301676) # Sat Jan 21 2023 11:47:56 -0000
    assert_equal "gj7x3vc", Lexicoid.from(1674301677) # Sat Jan 21 2023 11:47:57 -0000

    assert_equal "26222222", Lexicoid.from(2**32)          # Sun Feb 07 2106 06:28:16 -0000
    assert_equal "jzzzzzzzzzzzy", Lexicoid.from(2**63 - 1) # Sun Dec 04 292277026596 15:30:07 -0000
  end

  def test_from_with_floats
    assert_equal "22", Lexicoid.from(0.0)               # Thu Jan 01 1970 00:00:00 -0000
    assert_equal "gk", Lexicoid.from(100.0)             # Thu Jan 01 1970 00:01:40 -0000
    assert_equal "6wc2", Lexicoid.from(10000.0)         # Thu Jan 01 1970 02:46:40 -0000
    assert_equal "2ykm2", Lexicoid.from(500000.0)       # Tue Jan 06 1970 18:53:20 -0000
    assert_equal "5bse2", Lexicoid.from(1700000.0)      # Tue Jan 20 1970 16:13:20 -0000
    assert_equal "2apny22", Lexicoid.from(28000000.0)   # Sat Nov 21 1970 01:46:40 -0000
    assert_equal "6567f22", Lexicoid.from(550000000.0)  # Sat Jun 06 1987 17:46:40 -0000
    assert_equal "flllz22", Lexicoid.from(1550000000.0) # Tue Feb 12 2019 19:33:20 -0000
    assert_equal "gehebv2", Lexicoid.from(1654301676.0) # Sat Jun 04 2022 00:14:36 -0000
    assert_equal "gei4p52", Lexicoid.from(1654401676.0) # Sun Jun 05 2022 04:01:16 -0000
    assert_equal "gj7x3v2", Lexicoid.from(1674301676.0) # Sat Jan 21 2023 11:47:56 -0000
    assert_equal "gj7x3vc", Lexicoid.from(1674301677.0) # Sat Jan 21 2023 11:47:57 -0000
  end

  def test_from_with_datetimes
    assert_equal "22", Lexicoid.from(DateTime.parse("Thu Jan 01 1970 00:00:00 -0000"))
    assert_equal "gk", Lexicoid.from(DateTime.parse("Thu Jan 01 1970 00:01:40 -0000"))
    assert_equal "6wc2", Lexicoid.from(DateTime.parse("Thu Jan 01 1970 02:46:40 -0000"))
    assert_equal "2ykm2", Lexicoid.from(DateTime.parse("Tue Jan 06 1970 18:53:20 -0000"))
    assert_equal "5bse2", Lexicoid.from(DateTime.parse("Tue Jan 20 1970 16:13:20 -0000"))
    assert_equal "2apny22", Lexicoid.from(DateTime.parse("Sat Nov 21 1970 01:46:40 -0000"))
    assert_equal "6567f22", Lexicoid.from(DateTime.parse("Sat Jun 06 1987 17:46:40 -0000"))
    assert_equal "flllz22", Lexicoid.from(DateTime.parse("Tue Feb 12 2019 19:33:20 -0000"))
    assert_equal "gehebv2", Lexicoid.from(DateTime.parse("Sat Jun 04 2022 00:14:36 -0000"))
    assert_equal "gei4p52", Lexicoid.from(DateTime.parse("Sun Jun 05 2022 04:01:16 -0000"))
    assert_equal "gj7x3v2", Lexicoid.from(DateTime.parse("Sat Jan 21 2023 11:47:56 -0000"))
    assert_equal "gj7x3vc", Lexicoid.from(DateTime.parse("Sat Jan 21 2023 11:47:57 -0000"))
  end

  def test_from_with_times
    assert_equal "22", Lexicoid.from(Time.parse("Thu Jan 01 1970 00:00:00 -0000"))
    assert_equal "gk", Lexicoid.from(Time.parse("Thu Jan 01 1970 00:01:40 -0000"))
    assert_equal "6wc2", Lexicoid.from(Time.parse("Thu Jan 01 1970 02:46:40 -0000"))
    assert_equal "2ykm2", Lexicoid.from(Time.parse("Tue Jan 06 1970 18:53:20 -0000"))
    assert_equal "5bse2", Lexicoid.from(Time.parse("Tue Jan 20 1970 16:13:20 -0000"))
    assert_equal "2apny22", Lexicoid.from(Time.parse("Sat Nov 21 1970 01:46:40 -0000"))
    assert_equal "6567f22", Lexicoid.from(Time.parse("Sat Jun 06 1987 17:46:40 -0000"))
    assert_equal "flllz22", Lexicoid.from(Time.parse("Tue Feb 12 2019 19:33:20 -0000"))
    assert_equal "gehebv2", Lexicoid.from(Time.parse("Sat Jun 04 2022 00:14:36 -0000"))
    assert_equal "gei4p52", Lexicoid.from(Time.parse("Sun Jun 05 2022 04:01:16 -0000"))
    assert_equal "gj7x3v2", Lexicoid.from(Time.parse("Sat Jan 21 2023 11:47:56 -0000"))
    assert_equal "gj7x3vc", Lexicoid.from(Time.parse("Sat Jan 21 2023 11:47:57 -0000"))
  end

  def test_from_with_times_with_zone
    assert_equal "22", Lexicoid.from(Time.zone.parse("Thu Jan 01 1970 00:00:00 -0000"))
    assert_equal "gk", Lexicoid.from(Time.zone.parse("Thu Jan 01 1970 00:01:40 -0000"))
    assert_equal "6wc2", Lexicoid.from(Time.zone.parse("Thu Jan 01 1970 02:46:40 -0000"))
    assert_equal "2ykm2", Lexicoid.from(Time.zone.parse("Tue Jan 06 1970 18:53:20 -0000"))
    assert_equal "5bse2", Lexicoid.from(Time.zone.parse("Tue Jan 20 1970 16:13:20 -0000"))
    assert_equal "2apny22", Lexicoid.from(Time.zone.parse("Sat Nov 21 1970 01:46:40 -0000"))
    assert_equal "6567f22", Lexicoid.from(Time.zone.parse("Sat Jun 06 1987 17:46:40 -0000"))
    assert_equal "flllz22", Lexicoid.from(Time.zone.parse("Tue Feb 12 2019 19:33:20 -0000"))
    assert_equal "gehebv2", Lexicoid.from(Time.zone.parse("Sat Jun 04 2022 00:14:36 -0000"))
    assert_equal "gei4p52", Lexicoid.from(Time.zone.parse("Sun Jun 05 2022 04:01:16 -0000"))
    assert_equal "gj7x3v2", Lexicoid.from(Time.zone.parse("Sat Jan 21 2023 11:47:56 -0000"))
    assert_equal "gj7x3vc", Lexicoid.from(Time.zone.parse("Sat Jan 21 2023 11:47:57 -0000"))
  end

  def test_from_raises_for_improper_arguments
    ex = assert_raises(ArgumentError) { Lexicoid.from(Time.at(-1)) }
    assert_match(/after/, ex.message)

    ex = assert_raises(ArgumentError) { Lexicoid.from(DateTime.parse("Wed Dec 31 1969 23:59:59 -0000")) }
    assert_match(/after/, ex.message)

    ex = assert_raises(ArgumentError) { Lexicoid.from(1.day.before(Time.at(0))) }
    assert_match(/after/, ex.message)

    ex = assert_raises(ArgumentError) { Lexicoid.from(-1) }
    assert_match(/non-negative/, ex.message)

    ex = assert_raises(ArgumentError) { Lexicoid.from(-1.0) }
    assert_match(/non-negative/, ex.message)

    ex = assert_raises(ArgumentError) { Lexicoid.from("1234") }
    assert_match(/one of/, ex.message)
  end

  def test_kernel_method_delegates_correctly
    assert_equal Lexicoid(1234), Lexicoid.from(1234)
    assert_raises(ArgumentError) { Lexicoid.from(-1) }
  end

  def test_now_uses_the_current_time
    Time.stub :now, Time.at(1_678_943_067) do
      assert_equal "gkdeaqs", Lexicoid.now
    end
  end
end
