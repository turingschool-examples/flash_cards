require './lib/card'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    catagorized_cards = []

    @cards.each do |card|
      if (card.category == category)
        catagorized_cards.push(card)
      end
    end
    return catagorized_cards
  end

end
