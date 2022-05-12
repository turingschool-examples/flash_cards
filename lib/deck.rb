class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
  def count
    return cards.length
  end
  def cards_in_category(category)
    return_cards = []
    cards.each do |card|
      if card.category == category
        return_cards << card
      end
    end
    return return_cards
  end
end
