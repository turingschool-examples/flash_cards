class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    return turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def percent_correct
    if number_correct != 0
      (number_correct.to_f / @turns.length.to_f * 100).truncate(1)
    else
      0.0
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def number_by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    if number_by_category(category) != 0
      (number_correct_by_category(category).to_f / number_by_category(category).to_f * 100).truncate(1)
    else
      0.0
    end
  end

end
