class Deck

attr_reader :cards

  def initialize(cards)
    @deck = cards
  end


  def count
    cards.length
  end

  def cards_in_category(category)
    cards.slice(category)
  end
end
