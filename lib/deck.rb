require './lib/card'

class Deck
  attr_reader :cards, :count

  def initialize(cards_array)
    @cards = cards_array
    @count = cards_array.count
  end

  def cards_in_category(category_input) # Returns the number of cards that use the category from the argument provided
    category_specific_cards = self.cards.find_all do |card|
      if card.category == category_input
          card
      end
    end
  end


end
