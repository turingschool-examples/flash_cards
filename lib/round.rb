class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)

  end

  def current_card
    @deck.cards.shift
  end
end
