class Rooms

  attr_reader :room_number, :capacity

  def initialize(room_number, guests, songs, capacity)
    @room_number = room_number
    @guests = []
    @songs = []
    @capacity = capacity
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

  def add_guest_to_room(guest)
    room_has_capacity()
    if room_has_capacity == true
      @guests.push(guest)
    else return false
    end
  end

end
