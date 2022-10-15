require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
      @deck = deck
      @turns = []
      @number_correct = 0      
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    @deck.cards.shift
    if new_turn.correct?
      @number_correct += 1
    end
    return new_turn
  end

  def number_correct_by_category(category)
      turns.find_all do |turn|
        turn.card.category == category &&
        turn.guess == turn.card.answer
        turns << turn
      end
    return turns.count
  end

  def percent_correct
    number_correct.to_f / turns.count.to_f * 50.00
  end

  def percent_correct_by_category
    number_correct.to_f /
    number_correct_by_category(:Geography).to_f * 100
  end




end
