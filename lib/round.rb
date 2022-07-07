require 'turn'
require 'deck'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0.0
    @number_correct_by_category = {}
    @total_turns_by_category = {}
  end

  def current_card
    @deck[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck[0])

    if @total_turns_by_category[@deck[0].category] == nil
      @total_turns_by_category[@deck[0].category] = 0.0
    else
      @total_turns_by_category[@deck[0].category] += 1
    end

    if new_turn.correct?
      @number_correct += 1
      if @number_correct_by_category[@deck[0].category] == nil
        @number_correct_by_category[@deck[0].category] = 0.0
      else
        @number_correct_by_category[@deck[0].category] += 1
      end
    end

    @turns << new_turn
    @deck.shift
    new_turn
  end

  def number_correct_by_category(category)
    @number_correct_by_category[category]
  end

  def percent_correct
    @number_correct / @turns.length
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / @total_turns_by_category(category)
  end

end
