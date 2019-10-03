class Deck
  attr_accessor :deck
                :cards

  def initialize(deck, cards)
    @deck = deck
    @cards = cards
  end

  def count(cards)
    cards.count
  end

  def cards_in_category #(STEM, Geography, PopCulture)
    cards.count.catergory
  end

end
