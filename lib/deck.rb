require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards

  def initialize(cards)
  @cards = cards
  end

  def count
    @cards.length
  end

  def card_in_category(category)
    @cards.find_all do |card|
      card.category == category
    end
  end
end
