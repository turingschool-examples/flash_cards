class Deck
attr_reader :cards

  def initialize(cards)
    @cards     = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    collector = []

    @cards.each do |card|
      if card.category == category
        collector << card
      end
    end
    return collector
  end
end
