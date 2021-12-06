require './lib/card'
require './lib/turn'

class Deck

  def initialize(card)
    @card = card
    @cards = []
  end

  def cards
    @cards << @card
    return @cards
  end

  def count
    @card.count
  end




end
