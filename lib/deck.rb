class Deck
  attr_reader :cards, :count, :card_category

  def initialize(cards)
    @cards =cards
    @count = cards.length
  end

  def card_category
  end
    
end
