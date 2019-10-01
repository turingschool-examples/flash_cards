
require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return cards.length
  end

  def draw
    return cards.sample
  end


  def cards_in_category(cat)
    list = cards.select do |card|
      card.category == cat
    end
    return list
  end

end

