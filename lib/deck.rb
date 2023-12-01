class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count   
    @cards.length
  end

  def cards_in_category(category)
    found_cards = []
    cards.each do |card|
      if card.category == category      
        found_cards << card 
      end
    end
    found_cards
  end
end