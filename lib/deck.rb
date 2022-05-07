class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_a_category(category)
    card_categories = []
    @cards.each do |card|
      if card.category == category
        card_categories << card
      end
    end
    card_categories
  end
end
