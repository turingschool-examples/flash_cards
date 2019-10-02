class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count(cards)
    cards.count
  end

  def cards_in_category #(STEM, Geography, PopCulture)
    cards.count.catergory
  end

end
