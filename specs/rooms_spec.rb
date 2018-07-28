require("minitest/autorun")
require("minitest/rg")

require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class TestRooms < MiniTest::Test

  def setup
    @guest1 = Guests.new("Marvin")
    @guest2 = Guests.new("Sirius")
    @guest3 = Guests.new("Kathleen")
    @song1 = Songs.new("Let It go")
    @song2 = Songs.new("Part Of Your World")
    @guests = [@guest1, @guest2]
    @songs = [@song1, @song2]
    @room = Rooms.new(1, @guests, @songs, 3)
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

  def test_can_check_out_guest
    @room.add_guest_to_room(@guest3)
    @room.remove_guest_from_room(@guest3)
    assert_equal(2, @guests.count)
  end

  def test_add_song_to_room
    @room.add_song_to_room(@song1)
    @room.add_song_to_room(@song2)
    assert_equal(2, @songs.count)
  end

  def test_can_get_capacity
    assert_equal(3, @room.capacity)
  end

  def test_room_has_capacity
    # maximum = @room.capacity
    # no_of_guests = @guests.count
    assert_equal(true, @room.room_has_capacity(@guests))
  end



end
