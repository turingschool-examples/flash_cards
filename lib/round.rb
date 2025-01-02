class Round
  attr_reader :deck, :turns, :current_card_index

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    @current_card ||= deck.cards[@current_card_index]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @current_card_index += 1
    @current_card = nil
    turn
  end

  def number_correct
    @turns.select { |turn| turn.correct? == true }.count
  end

  def number_correct_by_category(category)
    @turns.select { |turn| turn.correct? && turn.card.category == category }.count
  end

  def percent_correct
    total = @turns.count
    correct = @turns.select { |turn| turn.correct? }.count
    return 0 if total == 0  # Avoid division by zero
    (correct.to_f / total) * 100
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.select { |turn| turn.card.category == category }.count
    correct_in_category = @turns.select { |turn| turn.card.category == category && turn.correct? }.count
    return 0 if correct_in_category == 0  # Avoid division by zero
    (correct_in_category.to_f / total_in_category) * 100
  end
end