

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[0])
    @turns.last
  end

end
