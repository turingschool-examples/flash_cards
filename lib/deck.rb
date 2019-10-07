require './lib/card'
require './lib/deck'
require 'pry'

class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(sorted_category)
    category_cards = []

    @cards.each do |card|
      if card.category == sorted_category
        category_cards << card
      end
    end
    category_cards
  end
end
