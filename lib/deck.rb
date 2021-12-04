require './lib/card'
require './lib/turn'

class Deck

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def cards
    @cards << Card.new
  end

  


end
