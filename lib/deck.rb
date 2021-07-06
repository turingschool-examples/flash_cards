require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards, :cards_by_category
  
  def initialize(cards)
    @cards = cards
    @cards_by_category = make_cards_by_category
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards_by_category[category] || []
  end

  def make_cards_by_category
    @cards.group_by(&:category)
  end
end
