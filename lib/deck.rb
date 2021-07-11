require './lib/card'

class Deck

  attr_reader :cards

  # initialize with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  # return the length of the deck of cards (how many cards in the deck)
  def count
    @cards.length
  end

  # iterate through the deck of cards and select the cards with a matching category
  # to that passed into the method.
  # return an array that has the cards that match the passed in category
  def cards_in_category(category)
    # want to return an array of cards that only has :STEM category
    # run through array and check if ':STEM' matches the last
    # element in the array
    @cards.select {|card| card.category == category}
  end
end
