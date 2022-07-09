class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    matches = []
    @cards.each do |card|
      if card.category == category
        matches << card
      end
    end
    matches
  end
end
