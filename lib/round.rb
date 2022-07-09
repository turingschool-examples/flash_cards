class Round
  def initialize(deck)
    @deck = deck
  end

  def turns
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end
end
