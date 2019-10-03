require './lib/card'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :deck
  attr_accessor :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

end
