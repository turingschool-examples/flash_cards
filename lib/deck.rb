require './lib/card'



class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards

  end

  def cards
    @cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    q_found = []
    @cards.each do |card|
      if card.category == cat
        q_found << card
      end
    end
    q_found
  end
end
