require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards_parameter)
    @cards = cards_parameter
  end

  def count
    cards.count
  end

  def cards_in_category(category_name)
    @category_name = category_name
    cards.find_all do |card|
      card.category == @category_name
    end
  end

end
