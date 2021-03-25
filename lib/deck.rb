require './lib/card'
require './lib/turn'
class Deck
  attr_reader :cards,
              :count,
              :card_in_category
  def initialize(cards, count, card_in_category)
  @cards = cards
  @count = count
  @card_in_category = card_in_category
  end
end
