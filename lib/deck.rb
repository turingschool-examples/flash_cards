class Deck
  attr_reader :cards, :sorted_cards

  def initialize(cards)
    @cards = cards
    @sorted_cards = sorted_cards
  end

  def count
    @cards.count
  end

  def cards_in_category(sort)
    @sorted_cards = @cards.select {|card| card.category == sort}
  end
end
