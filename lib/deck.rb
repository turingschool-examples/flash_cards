require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    thing = []
    @cards.each do |card|
      if card.category == category
        thing << card
      end
    end
    thing
  end
end
