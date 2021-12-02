class Round
  attr_reader :deck, :curr_card
  def initialize(deck)
    @deck = deck
    @curr_card = 0
  end

  def current_card
    @deck.cards[@curr_card]
  end
end
