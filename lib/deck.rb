require './lib/card'
require './lib/deck'

class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
  end
# QUESTION: Should I overwrite the default count method?
  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end
end
