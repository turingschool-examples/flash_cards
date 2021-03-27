class Round
  attr_reader  :deck,
                    :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.find do |card|
      card
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.card.answer == turn.guess
    end
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.card.answer == turn.guess 
    end.length
  end

  def percent_correct
    (number_correct.to_f / @turns.length) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / correct_category(category)) * 100
  end

  def correct_category(category)
  @turns.count do |turn|
    turn.card.category == category
    end
  end
end
