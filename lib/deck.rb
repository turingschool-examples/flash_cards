class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category)

    count = 0
    @cards.each do |card|
      require './lib/card'
      if card.category == category
        count =+ 1
      end
    end
    count
  end


end
