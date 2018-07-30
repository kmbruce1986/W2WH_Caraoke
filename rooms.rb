class Rooms

  attr_reader :room_number, :capacity, :till

  def initialize(room_number, guests, songs, capacity, till)
    @room_number = room_number
    @guests = []
    @songs = []
    @capacity = capacity
    @till = till
  end

  def guest_count
    return @guests.length
  end

  def song_count
    return @songs.length
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
    # index = @guests.index(guest).to_i
    # @guests.delete_at(index)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  def room_has_capacity()
    return @guests.length <= @capacity ? true : false
  end
  def add_money_to_till(entry_fee_or_drink)
    # it matters which comes first!
    @till += entry_fee_or_drink
  end

  def check_favourite_song_on_playlist(guest)
    @songs.find { |song| song == guest.fav_song} ? "Woo" : ""
  end

  def add_guest_to_room(guest, entry_fee)
    room_has_capacity()
    if room_has_capacity == true
      @guests << guest
      check_favourite_song_on_playlist(guest)
      add_money_to_till(entry_fee)
      guest.remove_money_from_wallet(entry_fee)
    else return false
    end
  end

  def remove_guest_if_skill_level_drops_to_one
    @guests.find { | guest | guest.skill_level == 1
    remove_guest_from_room(guest)}
  end

end
