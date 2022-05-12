class Deck
  attr_reader :cards, :found_cards
  def initialize(card_1, card_2, card_3)
    @cards = [card_1, card_2, card_3]

  end

  def count
    cards.count
  end

  def cards_in_category(category)
    @found_cards = @cards.select { |card| card.category == category }
    return @found_cards
  end

end
