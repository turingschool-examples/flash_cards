require './lib/card'

class Deck
  attr_reader :cards, :count

  def initialize(cards_array)
    @cards = cards_array
    @count = cards_array.length
  end

  def cards_in_category(category_input) # Returns an array of cards that use the category from the argument provided
    self.cards.find_all do |card|
      if card.category == category_input
          card
      end
    end
  end


end
