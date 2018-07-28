class Guests

  attr_reader :guest_name, :wallet, :fav_song

  def initialize(guest_name, wallet, fav_song)
    @guest_name = guest_name
    @wallet = wallet
    @fav_song = fav_song
  end

  def remove_money_from_wallet(entry_fee)
    @wallet -= entry_fee
  end

end
