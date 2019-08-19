class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

# number of cards in deck
  def count
    cards.count
  end

# return cards based on given category
  def cards_in_category(category)
    cards.find_all do |card|
      card.category == category
    end
  end
end
