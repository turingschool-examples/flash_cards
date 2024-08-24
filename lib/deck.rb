# Deck.rb
# require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    # binding.pry
    # cards.count { |card| card.category == category }
    cards.select { |card| card.category == category }
    # puts "***** #{category}"
  end
end
