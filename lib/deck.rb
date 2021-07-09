require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(input_category)
    categorize = @cards.find_all {|element| input_category == element.category}
    return categorize
  end

end
