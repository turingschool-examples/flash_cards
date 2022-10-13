#initialized w/ array of Card objects.
#should also return cards based on given category

class Deck
  attr_reader :card_deck
  def initialize(card_objects)
    @card_deck = card_objects
  end
end
