class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @turns = []
    @deck = deck
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    if new_turn.correct?
      @correct += 1
    end
    return new_turn
  end
end
