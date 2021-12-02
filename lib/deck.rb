class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards.push
  end
end
