# Desk class outline template


class Deck

  attr_reader :cards
#creates an array of Card objects with attributes
  def initialize (cards)
    @cards = cards
  end

#returns the number of cards in a deck
  def count
    @cards.length
  end

#returns a number of cards in a category
  def cards_in_category(category)
    @cards.select {|card| category == card.category}
  end
#why does this? but when called @deck.cards = @deck.cards.rotate, why no work?
  # def rotate_cards
  #   @cards = @cards.rotate
  # end

end
