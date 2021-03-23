class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    num_cards = 0
    cards.each do |card|
      if card.category == category
        num_cards += 1
      else
       num_cards
     end
    end
    return num_cards
  end
end
