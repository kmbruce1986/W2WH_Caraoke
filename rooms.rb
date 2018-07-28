class Rooms

  attr_reader :room_number, :capacity, :till

  def initialize(room_number, guests, songs, capacity, till)
    @room_number = room_number
    @guests = []
    @songs = []
    @capacity = capacity
    @till = till
  end

  def count_number_of_guests_in_room
    return @guests.length
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  def room_has_capacity()
    return @guests.length <= @capacity ? true : false
  end

  def add_guest_to_room(guest, entry_fee)
    room_has_capacity()
    if room_has_capacity == true
      @guests.push(guest)
      add_money_to_till(entry_fee)
      guest.remove_money_from_wallet(entry_fee)
    else return false
    end
  end

  def add_money_to_till(entry_fee)
    # it matters which comes first!
    @till += entry_fee
  end

end
