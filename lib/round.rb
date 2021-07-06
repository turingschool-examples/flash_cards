
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    next_turn = Turn.new(guess, current_card)
    @turns << next_turn
    @deck.cards.shift
    next_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

end
