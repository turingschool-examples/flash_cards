require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = 0
    @used_cards = []
  end

  def take_turn(current_guess)
    current_turn = Turn.new(current_guess, current_card)
    @turns << current_turn
    add_correct_turns(current_turn)
    next_card
    return current_turn
  end

  def add_correct_turns(turn)
    if turn.correct?
      @number_correct += 1
    end
  end

  def next_card
    @used_cards << @current_card
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (@number_correct / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.count) * 100
  end
end
