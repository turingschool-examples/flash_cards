class Deck
  attr_reader :cards,
              :count
  def initialize(cards)
    @cards = cards
    @count = @cards.size
  end
end
