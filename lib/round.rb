class Round
  attr_accessor :deck, :turns, :cards
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end
end
