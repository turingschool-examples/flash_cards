class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def take_turn
    # might need @deck.shift to remove the current card (first element) from the deck array
  end
end
