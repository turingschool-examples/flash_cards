

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(input_category)
    @cards.find_all do |card|
    card.category == input_category
    end
    # require "pry"; binding.pry
  end

end
