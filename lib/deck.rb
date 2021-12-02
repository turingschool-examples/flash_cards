class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards.push
    @count = @cards.length
  end
end
