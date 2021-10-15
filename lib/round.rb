require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(answer)
    # Record the turn
    turn = Turn.new(answer, current_card)
    @turns << turn

    # Instead of doing the rotating,
    # tell the deck to rotate itself
    deck.rotate

    turn
  end

  def number_correct
    correct_turns = turns.select do |turn|
      turn.correct?
    end
    correct_turns.count
  end

  def number_correct_by_category(category_name)
    correct_turns = turns.select do |turn|
      turn.correct? && (turn.card.category == category_name)
    end
    correct_turns.count
  end

  def percent_correct
    if !turns.empty?
      (number_correct.to_f)/(turns.count) * 100
    else
      0
    end
  end

  def percent_correct_by_category(category)
    if !turns.empty?
      (number_correct_by_category(category).to_f)/(count_turns_by_category(category)) * 100
    else
      0
    end
  end

  def count_turns_by_category(category)
    category_turns = turns.select do |turn|
      turn.card.category == category
    end
    category_turns.count
  end
end
