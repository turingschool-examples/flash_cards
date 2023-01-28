require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    turn
  end

  def calculate_num_correct_turns(turns)
    turns.reduce(0) { |memo, turn| turn.correct? ? memo + 1 : memo }
  end

  def turns_by_category(category)
    turns.select { |turn| turn.card.category == category }
  end

  def number_correct
    calculate_num_correct_turns(turns)
  end

  def number_correct_by_category(category)
    calculate_num_correct_turns(turns_by_category(category))
  end
  
  def percent_correct
    number_correct.to_f / turns.count * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / turns_by_category(category).count * 100
  end
end
