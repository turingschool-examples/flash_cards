require './lib/card'
require './lib/deck'

# Documentation for class Deck
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    num_of_cards = 0
    @cards.each do |card|
      num_of_cards += 1 if card.category == category
    end
    num_of_cards
  end
end
