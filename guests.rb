class Guests

  attr_reader :guest_name, :wallet, :fav_song, :skill_level

  def initialize(guest_name, wallet, fav_song, skill_level)
    @guest_name = guest_name
    @wallet = wallet
    @fav_song = fav_song
    @skill_level = skill_level
  end

  def remove_money_from_wallet(entry_fee)
    @wallet -= entry_fee
  end

  def buy_drink(bar, room)
    remove_money_from_wallet(bar.price)
    room.add_money_to_till(bar.price)
  end

  def increase_skill_level(amount)
    @skill_level += amount
  end

  def decrease_skill_level(amount)
    @skill_level -= amount
  end
end
