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
    @turns.count {|turn| turn.correct?} # select and count may be better
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (100.0 * number_correct / @turns.length).round(2)
  end

  def percent_correct_by_category(category)
    (100.0 * number_correct_by_category(category) / @turns.count {|turn| turn.card.category == category}).round(2)
  end

  def start
    p "Welcome! You're playing with #{deck.count} cards."
    p "-------------------------------------------------"
    p "This is card number #{turns.length + 1} out of #{deck.count}."
    p "Question: #{deck.cards[0].question}"
  end

end
