class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards #array
  end
  def count
    @cards.length
  end

  def cards_in_category(category)
    matching_category = []
    @cards.each do |card|
    if card.category == category
      matching_category.push card
    end
    end
    return matching_category
  end
end
