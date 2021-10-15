require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck              = deck
    @turns             = []
    @correct_responses = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.select do |turn|
      if turn.correct? == true
        @correct_responses << turn
      end
    end
    @correct_responses.length
  end

  # def number_correct_by_category(category)
  #   correct_responses = []
  #   @turns.select do |turn|
  #
  # end

end
