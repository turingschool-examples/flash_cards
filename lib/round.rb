require './lib/card'
require './lib/turn'
require './lib/deck'
# require "pry"; binding.pry
class Round
  attr_reader :deck
              :turns

  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
     new_turn = Turn.new(guess, current_card)
      @turns << guess
      return new_turn
  end

  # def take_turn(guess)
  # Turn.new(guess, current_card).map do
  # @turns << guess
  #
  # end

  def number_correct
    round.correct?.count
  end

  def number_correct_by_category(category)
    round.correct?.category
  end

  # def number_correct_by_category(category)
  #     @turns.find_all do |new_turn|
  #       turn.number_correct_by_category("") == true
  #     end
  # end

  def percent_correct
    round.percent
  end

  def percent_correct_by_category(category)
    round.percent.category
  end
end
