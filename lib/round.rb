require './lib/card'
require './lib/turn'
require './lib/deck'
require "pry"

class Round
  attr_reader :deck,
              :turns,
              :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    # @turns = turns
    @correct_turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(input)
    guess = input
    turn_wasd = Turn.new(guess, current_card)

    if turn_wasd.correct?
      @correct_turns << turn_wasd
    end

    @turns << turn_wasd
    turn_wasd
  end

  def number_correct
    @correct_turns.count
  end

  def number_correct_by_category(input)
    how_many = @correct_turns.select { |turn| turn.card.category ==  input }
    how_many.count
  end

  def percent_correct

    numerator_1 = @correct_turns.count.to_f
    denominator_1 = @turns.count.to_f
    (numerator_1/denominator_1) * 100
  end

  def percent_correct_by_category(info)
    numerator_1 = @correct_turns.select { |turn| turn.card.category ==  info }.count.to_f
    denominator_1 = @turns.select { |turn| turn.card.category ==  info }.count.to_f
    (numerator_1/denominator_1) * 100

  end

end
