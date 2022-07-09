require './lib/turn'

class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    card_by_category = []
    @cards.each do |card|
      if card.category == (category)
        card_by_category << card
      end
    end
    card_by_category
  end

end
