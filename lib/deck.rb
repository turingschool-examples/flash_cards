#initialized w/ array of Card objects.
#should also return cards based on given category

class Deck
  attr_reader :cards
  def initialize(card_objects)
    @cards = card_objects
  end

  def count
    @cards.count
  end
end
