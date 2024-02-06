require './lib/card'
require './lib/deck'

# Generates a deck of cards from an array of Card instances. The main
# difference between this class and an array of Cards is the
# .cards_in_category method.
# Syntax:
# deck = Deck.new([card1, card2, card3...])
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
