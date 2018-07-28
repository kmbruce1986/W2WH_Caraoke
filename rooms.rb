class Rooms

attr_reader :room_number

def initialize(room_number, guests, songs)
  @room_number = room_number
  @guests = []
  @songs = []
end

def count_number_of_guests_in_room
  return @guests.length
end

def add_guest_to_room(guest)
  @guests.push(guest)
end

end
