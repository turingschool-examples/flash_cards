require_relative 'card.rb'
require_relative 'turn.rb'
class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    return @cards.length
  end

  def cards_in_category(category_name)
    array = []
    @cards.each do |card|
      if card.category == category_name
        array << card
      end
    end
    return array
  end

end
