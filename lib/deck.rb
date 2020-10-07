require './lib/card.rb'


class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    cards_to_return = []
    @cards.each do |card|
      if card.category == category
        cards_to_return << card
      end
    end
    cards_to_return
  end

end
