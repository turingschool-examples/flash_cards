# Round class definition.

class Round
attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    return_turn = Turn.new(guess, current_card)
    @turns << return_turn
    return_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end
end