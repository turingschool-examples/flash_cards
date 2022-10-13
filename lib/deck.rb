require './card'

class Deck
  attr_reader :cards, :cards_in_category

  def initialize(cards)
    @cards = cards
    @cards_in_category = []
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    @cards_in_category = []
    @cards.each do |card|
      @cards_in_category << card if category.downcase == card.category.downcase
    end
    @cards_in_category
  end
end
