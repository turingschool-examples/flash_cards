class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end

  def current_card
    @deck.cards.shift
  end
end
