class Deck

  attr_reader :deck, :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
end
