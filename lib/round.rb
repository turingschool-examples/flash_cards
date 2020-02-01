require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_turns = []
  end

  def current_card_detect
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card_detect)
    @turns << new_turn
    if guess == current_card_detect.answer
      @number_correct += 1
      @correct_turns << new_turn
    end
    new_turn
  end

  def number_correct_by_category(category)
    correct_collect = @correct_turns.select{ |turn| category}
    correct_collect.count
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category

  end
end
