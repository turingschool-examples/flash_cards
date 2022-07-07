class Deck 
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end 
  def count 
    cards.count
  end 
  def cards_in_category(category)
    sorted_cards = []
    cards.select do |card| 
      if card.category == category
        sorted_cards << card
      end 
    end 
    sorted_cards  
  end 
end 