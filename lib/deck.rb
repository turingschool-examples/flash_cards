require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards
    cards = @cards
  end

  def count
    @cards.count
  end

  def cards_in_category(:STEM)
    @category = :STEM?
  end

  def cards_in_category(@category)
    cards.include? ":Geography"
  end

  def cards_in_category()
    cards.include? "Pop Culture"
  end
end
