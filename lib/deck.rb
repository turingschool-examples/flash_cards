class Deck
  attr_accessor :cards
  attr_reader :found_cards, :cards_in_category
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    @found_cards = cards.select { |card| card.category == category }
    return @found_cards
  end

end
