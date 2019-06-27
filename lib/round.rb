class Round
  attr_reader :deck, :turns, :cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @cards = cards
  end

  def current_card
    [@deck.cards[0]]
  end

end
