require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    thing = []
    @cards.each do |card|
      if card.category == cat
        thing << card
      end
    end
    thing
  end
end
