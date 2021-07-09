require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    include_category = []
    cards.each do |card|
      if card.category == category
        include_category << card
      end
    end
    include_category.count
  end
end
