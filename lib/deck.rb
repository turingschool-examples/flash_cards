class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count #.count is an enumerable method that returns the number of elements in the array
  end

  def cards_in_category(category)
    @cards.select { |card| card.category == category }
    #@cards refers to the instance variable, which is an array of card objects
    #.select is an enumerable method that returns a new array containing all elements of the original array for which the block returns true
    #{ indicates the beginning of a block
    #|card| is the block variable, which represents each element of the array as it iterates through
    #card.category will return the category attribute of the card object
    #== is a comparison operator that returns true if the category attribute of the card object is equal to the category argument
  end
end

