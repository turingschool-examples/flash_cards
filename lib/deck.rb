require './lib/card'
require './lib/turn'

class Deck

  def initialize(card)
    @card = card
    @cards = []
  end

  def category
    return card.category
  end

  def cards
    @cards << @card
    return @cards
  end

  def count
    @card.count
  end

  def cards_in_category(card_category)
    category_cards = []

    @cards.each do |each_card|
      if cards.category == card_category
        category_cards << each_card
      end
    end
  end

end
