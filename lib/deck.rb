require './lib/card'



class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
    @q_found = []
  end

  def cards
    @cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    @cards.each do |car|
      if @cards.include?(cat)
        @q_found << car
      end
    end
    @q_found
  end
end
