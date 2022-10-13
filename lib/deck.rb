class Deck

attr_reader :deck

  def initialize(cards)
    @deck = cards
  end


  def count
    deck.length
  end

  def cards_in_category(category)

  category_cards = []

  @deck.each do |card|
    if category == card.category
      category_cards << card
    end
  end

  return category_cards

  end
end
