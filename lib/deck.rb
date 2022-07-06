require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
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
    tally
  end
end
