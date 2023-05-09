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
    current_card = @deck.cards.shift
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    (number_correct.to_f / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.count { |turn| turn.card.category == category }
    (number_correct_by_category(category).to_f / turns_in_category) * 100
  end
end