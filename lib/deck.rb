# Deck class declaration.

class Deck
  attr_accessor :cards
  
  # Initialize Deck class attributes.
  def initialize(cards)
    @cards = cards
  end

  # count returns the size of the cards array parameter.
  def count
    @cards.size
  end

  # cards_in_category returns an array of cards from selected category.
  def cards_in_category(sel_category)
    @cards.select do |card|
      card.category == sel_category
     end
  end
end