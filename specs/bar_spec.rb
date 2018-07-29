require("minitest/autorun")
require("minitest/rg")

require_relative("../bar.rb")

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new("beer", 4)
  end

  def test_can_get_type
    assert_equal("beer", @bar.type)
  end

  def test_can_get_price
    assert_equal(4, @bar.price)
  end



end
