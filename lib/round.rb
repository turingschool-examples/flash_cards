require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns

  def initialize(deck_parameter)
    @deck = deck_parameter
    @turns = []
  end

  def current_card
    @deck.cards[0]
    end

  def take_turn(guess_parameter)
    @guess = guess_parameter
    Turn.new(@guess, current_card)
  end
    end
