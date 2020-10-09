class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
    # @deck = []
  end

  def count
    @cards.length
  end
end
