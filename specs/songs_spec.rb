require("minitest/autorun")
require("minitest/rg")

require_relative("../songs.rb")

class TestSongs < MiniTest::Test

  def setup
    @song = Songs.new("The Bear Necessities")
  end

  def test_can_get_song
    assert_equal("The Bear Necessities", @song.song_title)
  end

end
