require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  def count
    cards.count
  end

  def cards_in_category(card_category)
    cards.find_all { |card| card.category == card_category }
  end
    card_category
end
