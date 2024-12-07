# frozen_string_literal: true

# Creates a deck that can hold cards and identify them by category.
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(search_category)
    @cards.find_all { |card| search_category == card.category }
  end

  def categories
    @cards.map(&:category).uniq
  end
end
