# frozen_string_literal: true

# Creates a deck that can hold cards and identif them by category.
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(search_category)
    # The select method will return an array of elements that pass the tests within it's do/end.
    # In this case, each card in the cards array is passed into the select method as the variable 'card'.
    @cards.select do |card|
      # Here we check if the search_category argument matches the category of each card. If true, the card is selected.
      search_category == card.category
    end
    # Once all cards in the array are checked, the implicit return is the new array from the select method.
    # If no cards match the given category, and empty array is returned
  end
end
