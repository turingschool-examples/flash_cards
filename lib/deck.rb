# Deck class declaration.

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  # def cards_in_category(sel_category)

  # end
end