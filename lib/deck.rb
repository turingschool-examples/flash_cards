

class Deck

  attr_reader :cards, :deck
  def initialize(cards)
    @cards = cards
    @deck = []
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      #require "pry"; binding.pry
      category == card.category

    end
  end

end
