require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards_parameter)
    @cards = cards_parameter
  end

  def count
    cards.count
  end

  def cards_in_category(category_parameter)
    cards.each do |card|
      if card.category == category_parameter
        puts card
      else
        puts []
      end
    end
  end
end
