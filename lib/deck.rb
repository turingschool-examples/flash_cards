class Deck
  attr_reader :deck, :cards

  def initialize(cards)
    @cards = []
  end

  def deck(cards)
    for card in cards
      @cards << card
    end
  end

  def cards_in_deck
    @cards
  end

  def count
    @cards.count()
  end

end
