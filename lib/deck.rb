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
    number_of_cards = []
    @cards.select do |card|
      if card.category == category
        number_of_cards << card
      end
    end
  end

end
