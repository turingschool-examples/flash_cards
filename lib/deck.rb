# frozen_string_literal: true

# Stores array of Card Objects.
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select { |card| card.category == category }
  end
end
