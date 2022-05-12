class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.count
  end

  def cards_in_category(category)
    category_cards = []
    # Iterate through all of the cards in the deck
    # If the category of the given card == category parameter, shovel into category_cards
    @cards.each do |card|
      if card.category == category
        category_cards << card
      end
    end
    return category_cards
  end

end
