require './lib/card'

class Deck
  attr_reader :cards
              # :count,
              # :cards_in_category

  def initialize(cards)
    @cards = cards
    # @count = count
    # @cards_in_category = []
  end

  # def add_card(card)
  #   @cards << card
  # end

  def count_cards
    cards.count
  end

  def cards_in_category(category)
    cards.select do |card|
      card.category == category
    end
  end
end
