class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
     new_turn = Turn.new(guess, current_card)
     @deck.cards.rotate!
     @turns << new_turn
     new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true}
  end

  def number_correct_by_category(category)
    @turns.find_all { |turn| turn.correct? && turn.card.category == category}.count
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = @turns.find_all { |turn| turn.correct? == true}
     (correct.count.to_f / number_correct_by_category(category) * 100
  end
end
