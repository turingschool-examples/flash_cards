class Deck
  attr_reader :cards,
              :count
  def initialize(cards)
    @cards = cards
    @count = @cards.size
  end

  def cards_in_category(category)
  end
end
