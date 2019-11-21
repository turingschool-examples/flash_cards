require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Round

  attr_reader :deck, :turns, :total_correct, :num_correct_by_cat, :num_asked_per_cat

  def initialize(deck)
    @deck = deck
    @turns = []
    @total_correct = 0
    @current_card_number = 0
    @num_correct_by_cat = Hash.new(0)
    @num_asked_per_cat = Hash.new(0)
  end

  def current_card
    @deck.cards[@current_card_number]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn

    @current_card_number += 1
    if guess == current_card.answer
      @total_correct += 1
      @num_correct_by_cat[current_card.category] += 1
    end

    @num_asked_per_cat[current_card.category] += 1

    new_turn
  end

  def percent_correct
    (@total_correct.to_f / @turns.count.to_f) * 100
  end

end
