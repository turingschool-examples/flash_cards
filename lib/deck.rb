require 'pry'
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category)
    arr = []
      cards.each do |card|
      if card.category == category
        arr << card
      end
    end
    return arr
  end
end
