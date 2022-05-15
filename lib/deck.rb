class Deck
  attr_reader :cards, :deck
  def initialize(cards, deck)
    @cards = cards
    @deck = deck
  end

  def count
    @card.length
  require "pry"; binding.pry
  end

  def cards_in_category(category)
    matching_cards = []
    @cards.each do |card|
      if card.category == cards_in_category
        matching_cards << card

      end
      return matching_cards
    end
  end
end
