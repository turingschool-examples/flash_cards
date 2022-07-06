require './lib/card'
require './lib/turn'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.count
  end

end
