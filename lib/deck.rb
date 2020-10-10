class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    expected = []
    cards.find_all do |card|
      if card.category == category
        expected << card
      end
    end
  end

end
