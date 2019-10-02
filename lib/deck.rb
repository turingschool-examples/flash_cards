class Deck
  attr_reader :cards, :count 
  def initialize(cards)
    @cards = cards
    @count = cards.length
  end
  def cards_in_category(category)
    result = cards
    
    cards.each do |card|
      if card.category != category
        result.delete(card)
      end
    end
    result
  end
end