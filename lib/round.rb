require './lib/card'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :deck
  attr_accessor :turns, :turn
  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards.shift
  end


  def take_turn(guess)
    @turn = Turn.new(guess, current_card)
    @turns << @turn
    @turns.last
  end

  def round_count
    @turns.count + 1
  end

end
