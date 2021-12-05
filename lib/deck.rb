class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  # def cards_in_category
  #   return @cards.category
  # end
end
