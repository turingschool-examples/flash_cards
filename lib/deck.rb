class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def cards_in_category(this_category)
    cards.select {|card| card.category == this_category}
  end
end
