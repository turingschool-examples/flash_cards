require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(card_array)
      @cards = card_array
  end

  # This method counts the number of cards in a deck
  def count
    @cards.count
  end

  def cards_in_category(card_category)
    array = []
    @cards.each do |card|
      if card.category == card_category
        array << card
      end
    end
    return array
  end
end

# This chunk of code below was used for testing purposes.
# Not necessary to keep.

# card1 = Card.new("1?", "Yes", :History)
# card2 = Card.new("2?", "No", :Math)
# card3 = Card.new("3?", "Maybe", :STEM)
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
#
# # require "pry"; binding.pry
