require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
    @number_correct = 0
  end

  def take_turn(current_guess)
    current_turn = Turn.new(current_guess, current_card)
    @turns << current_turn
    add_correct_turns(current_turn)
    next_card
    return current_turn
  end

  def current_card
    deck.cards[@current_card]
  end

  def add_correct_turns(turn)
    if turn.correct?
      @number_correct += 1
    end
  end

  def next_card
    @current_card += 1
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (@number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.count.to_f) * 100
  end
end
