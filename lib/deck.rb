class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.length
  end

  def cards_in_category(category)
    result = @cards.select {|card| card.category == category}
    return result.length
  end
end