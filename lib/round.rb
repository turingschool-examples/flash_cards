class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    return new_turn
  end

  def correct_turns
    @turns.find_all do |turn|
      turn.correct?
    end
  end

  def number_correct
    correct_turns.count
  end

  def number_correct_by_category(category)
    correct_turns.find_all do |turn|
      turn.card.category == category
    end.count
  end

  def percent_correct
    number_correct.fdiv(@turns.length) * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).fdiv(number_correct_by_category(category)) * 100
  end

  def cards_remaining?
    if @turns.count + 1 <= deck.cards.count
      true
    else
      false
    end 
  end
end
