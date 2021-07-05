require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @categories = make_categories
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @categories[category] || []
  end

  def make_categories
    @cards.group_by(&:category)
  end
end
