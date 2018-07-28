class Guests

  attr_reader :guest_name, :wallet

  def initialize(guest_name, wallet)
    @guest_name = guest_name
    @wallet = wallet
  end

  def remove_money_from_wallet(entry_fee)
    @wallet -= entry_fee
  end

end
