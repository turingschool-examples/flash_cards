class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    new_turn
  end

  def advance_card
    deck.cards.rotate!(1)
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category}
  end

  def percent_correct
    100.0 * (number_correct.to_f / @turns.count)
  end

  def percent_correct_by_category(category)
    100.0 * (number_correct_by_category(category).to_f /
    @turns.map.count { |turn|
      turn.card.category == category})
  end
end
