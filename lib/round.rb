require_relative 'deck.rb'
require_relative 'turn.rb'

class Round

  attr_accessor :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    Turn.new(guess, @current_card)

  end

end
