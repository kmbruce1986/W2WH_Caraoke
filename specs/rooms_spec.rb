require("minitest/autorun")
require("minitest/rg")

require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class TestRooms < MiniTest::Test

  def setup
    @guest1 = Guests.new("Marvin")
    @guest2 = Guests.new("Sirius")
    @song1 = Songs.new("Let It go")
    @song2 = Songs.new("Part Of Your World")
    @guests = [@guest1, @guest2]
    @songs = [@song1, @song2]
    @room = Rooms.new(1, @guests, @songs)
  end

  def test_can_get_room_number
    assert_equal(1, @room.room_number)
  end

  def test_count_number_of_guests_in_room
    @room.count_number_of_guests_in_room
    assert_equal(2, @guests.count)
  end

  def test_can_check_in_guest
    @room.add_guest_to_room(@guest1)
    @room.add_guest_to_room(@guest2)
    assert_equal(2, @guests.count)
  end



end
