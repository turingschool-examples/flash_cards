require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  def count
   cards.count
  end
  def cards_in_category(name)
  cards.select do |card|
    card.category == name
   end
  end
end
