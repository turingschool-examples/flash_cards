require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(card)
    @cards = card
  end

  def cards
    @cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards.each do |key, value|
      if(key.category == category)
        key
      end
    end
  end

end
