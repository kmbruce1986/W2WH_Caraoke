require("minitest/autorun")
require("minitest/rg")

require_relative("../rooms.rb")

class TestRooms < MiniTest::Test

  def setup
    @room = Rooms.new(1)
  end

  def test_can_get_room_number
    assert_equal(1, @room.room_number)
  end



end
