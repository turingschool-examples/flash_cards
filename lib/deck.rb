class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def count
    @cards.count
  end
  def cards_in_category(category)
    cards.select{|cat| @category == category}
  end
end
