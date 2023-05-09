class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.first)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.select { |turn| turn.correct? }.count
  end

  def number_correct_by_category(category)
    @turns.select { |turn| turn.correct? && turn.card.category == category }.count  
  end

  def percent_correct_by_category(category)
    number_correct = @turns.select { |turn| turn.correct? && turn.card.category == category }.count
    number_in_category = @turns.select { |turn| turn.card.category == category }.count
    (number_correct / number_in_category.to_f) * 100
  end
end