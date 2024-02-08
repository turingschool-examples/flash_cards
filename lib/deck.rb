class Deck
  attr_reader :cards, :current_card
  
  def initialize(cards)
    @cards = cards
    # @current_card = @cards[0]
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
 
