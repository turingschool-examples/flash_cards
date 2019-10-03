require './lib/card'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :deck
  attr_accessor :turns, :this_card
  def initialize(deck)
    @deck = deck
    @turns = []



  end

  def current_card
    this_card = @deck.cards.first

  end
  @this_card
end
