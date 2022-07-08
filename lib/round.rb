require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def turns
    @turns += 1
  end

end
