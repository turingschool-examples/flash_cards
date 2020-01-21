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
    @turns.push(Turn.new(guess, @current_card))[0]

  end

end
