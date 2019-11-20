require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @total_correct = 0
    @current_card_number = 0
  end

  def current_card
    @deck.cards[@current_card_number]
  end

  def take_turn(guess, current_card)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn



    new_turn
  end

end
