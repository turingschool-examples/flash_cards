class Round

  attr_reader :deck, :turns, :card_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_count = 0
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def categories
    @turns.map {|turn| turn.card.category }.uniq
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

end
