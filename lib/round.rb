class Round
  attr_reader :deck
  attr_accessor :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn
    # might need @deck.shift to remove the current card (first element) from the deck array
  end
end
