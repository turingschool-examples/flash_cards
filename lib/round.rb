class Round
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @current_card_index += 1
    new_turn
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def percent_correct
    return 0 if @turns.empty?

    (number_correct.to_f / @turns.size * 100).round(2)
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.select { |turn| turn.card.category == category }
    return 0 if turns_in_category.empty?

    correct_in_category = turns_in_category.count(&:correct?)
    (correct_in_category.to_f / turns_in_category.size * 100).round(2)
  end
end