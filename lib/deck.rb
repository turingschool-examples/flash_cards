class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    # require "pry"; binding.pry
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end

end
