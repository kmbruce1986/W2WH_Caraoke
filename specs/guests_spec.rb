require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../bar.rb")

class TestGuests < MiniTest::Test

  def setup
    @guest = Guests.new("John", 10, "The Bear Necessities")
  end

  def test_can_get_guest_name
    assert_equal("John", @guest.guest_name)
  end

  def test_can_get_amount_in_wallet
    assert_equal(10, @guest.wallet)
  end

  def test_can_remove_money_from_wallet
    @guest.remove_money_from_wallet(5)
    assert_equal(5, @guest.wallet)
  end

  def test_can_return_fav_song
    assert_equal("The Bear Necessities", @guest.fav_song)
  end

  def test_can_buy_drink
    @bar = Bar.new("wine", 5)
    @room = Rooms.new(1, @guest, @song, 3, 100)
    @guest.buy_drink(@bar, @room)
    assert_equal(5, @guest.wallet)
    assert_equal(105, @room.till)
  end

end
