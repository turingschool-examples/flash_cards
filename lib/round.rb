

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
    @turns << Turn.new(guess, @deck.cards[0])
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.correct? && turn.card.category == category}
  end

  def percent_correct
  100 * (self.number_correct / @turns.count.to_f)
  end

  def percent_correct_by_category(category)
  100 * self.number_correct_by_category(category) / @turns.count {|turn| turn.card.category == category}
  end

end
