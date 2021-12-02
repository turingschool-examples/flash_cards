class Deck
  attr_reader :cards, :card_1, :card_2, :card_3

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards.include? :STEM
    return cards[1,2]
  end
end
