class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    ret_cards = []
    @cards.each do |card| 
      if card.category == category
        ret_cards.push(card)
      end
    end
    return ret_cards
  end

end