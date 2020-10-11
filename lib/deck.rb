class Deck
attr_reader :cards, :count

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.length
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
