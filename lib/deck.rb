# The Deck class represents a collection of cards.
# It provides functionality to count cards and filter them by category.
class Deck
  # Provides read-only access to the cards in the deck
  attr_reader :cards

  # Initializes a new Deck with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  # Returns the total number of cards in the deck
  def count
    @cards.length
  end

  # Returns an array of cards that belong to the specified category
  def cards_in_category(category)
    @cards.select { |card| card.category == category }
  end
end
