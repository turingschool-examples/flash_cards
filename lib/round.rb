class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    current_card = deck.cards.rotate!
    new_turn
  end

  def correct
    turns.select { |turn| turn.correct? }
  end

  def number_correct
    correct.count
  end

  def number_correct_by_category(category)
    correct.count { |turn| turn.card.category == category }
  end

  def turns_by_category(category)
    turns.count { |turn| turn.card.category == category }
  end

  def percent_correct
    ((correct.count.to_f / turns.count.to_f) * 100).round(0)
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_by_category(category).to_f) * 100
  end

#figure out why this count is backwards
  def turn_count
    @deck.cards.count - @turns.count
  end

  def turn_count2
    @deck.cards.find_index(current_card) + 1
  end



end
