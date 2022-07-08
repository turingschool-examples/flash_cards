require './lib/card'
require './lib/turn'
require './lib/deck'
require "pry"

class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    # @turns = turns
    @correct_turns = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(input)
    guess = input
    turn_wasd = Turn.new(guess, current_card)
    @turns << turn_wasd

    if turn_wasd.correct?
      @correct_turns << turn_wasd
    end

    turn_wasd
  end

end
