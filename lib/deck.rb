require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    @category_catch = []
    @cards.select do |card|
      card.category == category
    end
    # require "pry"; binding.pry
  end
end
