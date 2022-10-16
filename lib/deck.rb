class Deck
  attr_reader :cards

  attr_accessor :cards_in_category

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category
    @cards_in_category = @cards + @category[2]
  end
end
