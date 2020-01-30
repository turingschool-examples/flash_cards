class Deck
  attr_reader :cards, :count
  def initialize(deck)
    @cards = deck
    @count = deck.count
  end
end
