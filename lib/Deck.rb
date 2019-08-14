class Deck
  attr_reader :card

  def initialize (card)
    @card = []
  end

  def add_card_too_deck(card)
    @card << card
  end
end
