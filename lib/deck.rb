require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count_cards
    return @cards.count
  end

  def cards_in_category(category)
    @cards_in_category = []
    @cards.each do |card|
      if category.to_sym == card.category
        @cards_in_category << card 
      end
    end
    return @cards_in_category
  end
end
