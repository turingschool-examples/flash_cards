# require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card()
    return deck.cards[0]
  end

  def take_turn(guess)
    this_turn = Turn.new(guess, current_card())
    @turns << this_turn
    # @deck.rotate(1)
    return this_turn
    #require 'pry'; binding.pry
  end
end
