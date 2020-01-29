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
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.select {|turn| turn.correct?}.count
  end

  def number_correct_by_category(category)
    @turns.select {|turn| turn.card.category == category && turn.correct?}.count
  end

  def percent_correct
    100.0 * number_correct / @turns.count
  end
end
