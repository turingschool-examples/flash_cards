class Deck
  attr_reader :cards
  def initialize(cards)

    @cards = cards
    p cards

  end

  def count
    return cards.length
  end
end
