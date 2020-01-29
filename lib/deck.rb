require "./lib/card"


class Deck
  attr_reader :cards
  
  def initialize(cards = Card.new)
    @cards = cards
  end
end
