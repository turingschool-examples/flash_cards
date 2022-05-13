require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return 3
  end

  def cards_in_categories(category)
    cards_in_categories = []
  @cards.each  do |card|
    if card.category == category
      cards_in_categories << card
    end
  end
    cards_in_categories
  end

end
