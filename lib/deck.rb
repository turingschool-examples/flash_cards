class Deck
  def initialize(cards)
    @cards_in_deck = cards
  end

  def cards
    @cards_in_deck
  end

  def count
    @cards_in_deck.count
  end
end
