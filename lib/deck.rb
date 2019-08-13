require 'pry'

class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    @count = cards.count
  end

  def cards_in_category(category)
    @cards.find_all do |card|
      category == card.category
    end
  end

end
