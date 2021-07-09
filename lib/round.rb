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
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct?}
  end

  def number_correct_by_category(cat)
    @turns.count { |turn| turn.card.category == cat && turn.correct? }
  end

  def percent_correct
    number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(cat)
    number_correct_by_category(cat) / @deck.cards_in_category(cat).length.to_f * 100
  end
end
