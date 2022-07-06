require './lib/card'
require './lib/turn'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

end
