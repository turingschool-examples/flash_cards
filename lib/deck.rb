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
    card.include?(category_parameter) == true
    puts card
  end
end



end
