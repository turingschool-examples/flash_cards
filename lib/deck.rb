class Deck
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    category_matches_card = []

    cards.each do |card|
      if card.category == category
        category_matches_card << card
      end
    end
    category_matches_card
 end
end
