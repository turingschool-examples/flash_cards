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
    turn = Turn.new(guess, current_card)
    @turns << turn
    next_card
    return turn
  end

  def next_card
    top_card = @deck.cards.shift
  end

  def number_correct
    correct_turns.count
  end

  def number_correct_by_category(category)
    correct_turns.count do |turn|
      turn.card.category == category
    end
  end

  def correct_turns
    @turns.find_all do |turn|
      turn.card.answer == turn.guess
    end
  end

  def percent_correct
    ((number_correct).to_f / (@turns.count).to_f) * 100
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category)).to_f / (total_number_by_category(category)).to_f) * 100
  end

  def total_number_by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end
end
