class Deck
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(subject)
    
    @cards.select do |card| 
      card.category == subject
    end

  end
end
 
