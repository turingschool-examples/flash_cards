class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    count = 0
    @cards.each do |card|
      count += 1 if card.category == cat
    end
    return count
  end
end
