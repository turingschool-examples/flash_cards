require './lib/card'

class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(by_category)

    @cards.select do |card|
      card.category == by_category
    end
  end
end
