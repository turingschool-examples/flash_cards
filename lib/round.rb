class Round

  attr_reader :deck, :round, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn
    @turns << @deck.cards[0]
    @turn2 = Turn.new("Mars", @card2)
  end

end
