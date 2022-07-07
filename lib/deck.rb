require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def card_at(index)
    @cards[index]
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    tally = []
    @cards.each do |num|
      if (num.category == category)
        tally.push(num)
      end
    end
    tally
  end
end