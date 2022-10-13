require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
      cat_count = []

      cards.each do |card|
        if cat == card.category then
         cat_count << card
        end
      end
      cat_count
  end
end
