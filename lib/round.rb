

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    return @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns.push(new_turn)
    new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true }
  end

  def number_correct_by_category(category)
    turns_in_category = turns_by_category(category)
    turns_in_category.count { |turn| turn.correct? == true }
  end

  def percent_correct
    (number_correct.to_f / @turns.length * 100).round(4)
  end

  def percent_correct_by_category(category)
    turns_in_category = turns_by_category(category)
    number_correct = turns_in_category.count { |turn| turn.correct? == true }
    (number_correct.to_f / turns_in_category.length * 100).round(4)
  end

  # Helper methods
  def turns_by_category(category)
    @turns.select { |turn| turn.card.category == category }
  end
end
