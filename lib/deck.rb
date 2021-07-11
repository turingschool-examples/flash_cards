class Deck
attr_reader :cards

  def initialize(cards)
  @cards = cards
  end
#
  def count
    count = cards.count
  end

  def cards_in_category(cat)
    return @cards.select { |e| e.category == cat  }
  end
end
