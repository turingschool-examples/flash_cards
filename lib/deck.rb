# Create a Deck class with an accompanying test file. A Deck is initialized with an array of Card objects. A Deck should also be able to return cards based on a given category.
class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count() #not sure if should make individual method - .count() counts the # of objects in array

  end



end
