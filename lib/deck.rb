class Deck

  def initialize(cards_parameter)
    @cards = cards_parameter
  end

  def add_new_card(card_name)
    @cards << card_name
  end

end
