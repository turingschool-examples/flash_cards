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

  def number_correct_by_category(category_select)
    @turns.count do |turn|
      turn.correct? && turn.card.category == category_select
    end
  end

  def percent_correct
    if @turns.size == 0
      0.0
    else
      ((number_correct.to_f / @turns.size.to_f) * 100.0).truncate(1)
    end
  end
end