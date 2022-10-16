require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
#.count is also a built in method.
  def count
    cards.length
  end

  def cards_in_category(category)
    categories = []
    cards.each do |card|
      if card.category == category
      categories << card
      end
    end
    categories
  end
end
