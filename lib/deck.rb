require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards_witin_category = []
    @cards.each do |card|
      if card.category == category
        cards_witin_category << card
      end
    end
    cards_witin_category
  end

end
