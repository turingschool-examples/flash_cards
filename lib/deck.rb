require './lib/card'
require './lib/deck'

class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  # how to do this?
  def cards_in_category(category)
    cards_return = []
    cards.each do |card|
      if card.category == category
        cards_return << card
      end
    end
    return cards_return
  end

end
