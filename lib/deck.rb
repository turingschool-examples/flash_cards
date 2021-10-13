class Deck
  attr_reader :cards, :category

  def initialize (cards)
    @cards = cards
    @category = category
  end

  def count
    cards.length
  end

  def cards_in_category(type)
    categorize = []
    cards.each do |card|
      categorize << card if card.category == type
    end
    categorize
  end

end
