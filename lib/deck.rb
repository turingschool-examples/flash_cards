require_relative 'round'

class Deck < Round
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    matches = []
    @cards.each do |card|
      if category == card.category
        matches << card 
      end
    end
  end
end
