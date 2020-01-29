require "./lib/card"


class Deck

  def initialize(cards = Card.new)
    @cards = cards
  end
end
