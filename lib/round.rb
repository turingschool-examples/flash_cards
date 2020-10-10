class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    advance_card
    return new_turn
  end

  def advance_card
    deck.cards.rotate!(1)
    @current_card = deck.cards.first
  end

  def number_correct
    correct = turns.select do |turn|
      turn.correct?
    end
    correct.count
  end

  def number_correct_by_category(category)
    correct_by_category = turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    correct_by_category.count
  end

  def percent_correct
    (100.0 * number_correct / turns.count).round(2)
  end

  def percent_correct_by_category(category)
    turns_by_category = @turns.select do |turn|
      turn.card.category == category
    end
    (100.0 * number_correct_by_category(category) / turns_by_category.count).round(2)
  end
end
