require './lib/card'
require './lib/turn'

class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def count
    return @cards.count
  end

  def cards_in_category(desired_category)
    @cards.select { |card| card.category == desired_category}
  end

end
