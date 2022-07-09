class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct_turns.count

  end

  def number_correct_by_category(category)
    correct_turns.select { |turn| turn.card.category == category }.count
  end

  def percent_correct
    ((number_correct.to_f / @turns.count) * 100).truncate()
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / deck.cards_in_category(category).count.to_f) * 100
  end

  private

  def correct_turns
    @turns.select {|turn| turn.correct? }
  end

end
