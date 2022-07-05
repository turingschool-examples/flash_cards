require './lib/card.rb'

class Deck

  def initialize(cards)
    @cards = cards
  end

  def cards
    return @cards
  end

  def count
    return cards.count
  end

  def cards_in_category(category)
    @category = category
    tally = []
    cards.each do |num|
      if (num.category_quiet == @category)
        tally.push(num)
      end
    end
    p tally
  end
end
