require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_accessor :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    test_array = []
    @deck.cards.each { |card| test_array << card }
    test_array[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    outcome = []
    @turns.each { |x| outcome << x.correct? }
    outcome.count(true)
  end

  def number_correct_by_category(flashcard_category)
    outcome_cat = []
    @turns.each do |x|
      if x.card.category == flashcard_category && x.correct?
        outcome_cat << x.card.category
      end
    end
    outcome_cat.count
  end

  def percent_correct
  end

  def percent_correct_by_category
  end

end
