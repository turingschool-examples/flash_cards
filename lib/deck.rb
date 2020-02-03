class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(card_category)
    @cards.find_all {|card| card.category == card_category}
  end
end
