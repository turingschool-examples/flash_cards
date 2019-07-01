class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @card_array = @deck.cards
    @turns = []
  end

  def current_card
    @card_array[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @card_array = @card_array.rotate
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct
    number_correct * 1.0 / @turns.count * 100
  end

  def percent_correct_by_category(category)
    card_count_by_category = @turns.count { |turn| turn.card.category == category }
    number_correct_by_category(category) * 1.0 / card_count_by_category * 100
  end

end
