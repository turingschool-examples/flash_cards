class Round
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    return @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards.shift)
    @turns.push(turn)
  end
end
