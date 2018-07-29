require("minitest/autorun")
require("minitest/rg")

require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class TestRooms < MiniTest::Test

  def setup
    # I need to go over the setup of this.
    @guest1 = Guests.new("Marvin", 20, "Everybody Wants to be a Cat", 4)
    @guest2 = Guests.new("Sirius", 30, "A Friend in Me", 4)
    @guest3 = Guests.new("Kathleen", 5, "When Will My Life Begin?", 1)
    @guest4 = Guests.new("Barry", 3, "I Want to build a snowman", 6)
    @song1 = Songs.new("Let It go")
    @song2 = Songs.new("Part Of Your World")
    @guests = [@guest1, @guest2, @guest3]
    @songs = [@song1, @song2]
    @room = Rooms.new(1, @guests, @songs, 3, 100)
  end

  def test_can_get_room_number
    assert_equal(1, @room.room_number)
  end

  def test_count_number_of_guests_in_room
    @room.add_guest_to_room(@guest1, 5)
    @room.add_guest_to_room(@guest2, 5)
    @room.add_guest_to_room(@guest3, 5)
    @room.guest_count
    assert_equal(3, @room.guest_count)
  end

  def test_can_check_in_guest
    # @room.add_money_to_till(5)
    @room.add_guest_to_room(@guest4, 5)
    assert_equal(1, @room.guest_count)
    assert_equal(105, @room.till)
  end

  def test_can_check_out_guest
    @room.add_guest_to_room(@guest1, 5)
    @room.add_guest_to_room(@guest2, 5)
    @room.add_guest_to_room(@guest3, 5)
    @room.remove_guest_from_room(@guest3)
    assert_equal(2, @room.guest_count)
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
    assert_equal(true, @room.room_has_capacity())
  end

  def test_guest_rejected_if_no_capacity

    # I'm not 100% why I need to define the entry_fee here - is there a more elegant way to do this? Should I add the entry fee to the Room class?
    entry_fee = 5
    @room.add_guest_to_room(@guest1, entry_fee)
    @room.add_guest_to_room(@guest2, entry_fee)
    @room.add_guest_to_room(@guest3, entry_fee)
    @room.add_guest_to_room(@guest4, entry_fee)
    assert_equal(4, @room.guest_count)
  end

  def test_can_get_amount_in_till
    assert_equal(100, @room.till)
  end

  def test_can_add_money_to_till
    @room.add_money_to_till(5)
    assert_equal(105, @room.till)
  end

  def test_favourite_song_on_playlist
    @room.add_song_to_room("Everybody Wants to be a Cat")
    result = @room.check_favourite_song_on_playlist(@guest1)
    assert_equal("Woo", result)
  end

  def test_remove_guest_if_skill_level_drops_to_1
    @room.add_guest_to_room(@guest1, 5)
    @room.add_guest_to_room(@guest2, 5)
    @room.add_guest_to_room(@guest3, 5)
    @room.remove_guest_if_skill_level_drops_to_one
    assert_equal(2, @room.guest_count)
  end




end
