require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")

class TestGuests < MiniTest::Test

  def setup
    @guest = Guest.new("John")
  end

def test_can_get_guest_name
  assert_equal("John", @guest.guest_name)
end

end
