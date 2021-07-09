require './lib/card'

class Deck

  attr_reader :cards

  # initialized with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    # want to return an array of cards that only has :STEM category
    # run through array and check if ':STEM' matches the last
    # element in the array

    @cards.select {|card| card.category == category}

  end

end
