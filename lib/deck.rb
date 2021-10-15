require_relative 'card'
require_relative 'turn'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    cards.select {|item| item.category == category}
  end
  
end
