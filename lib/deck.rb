class Deck

  attr_reader :cards, :category
  def initialize(cards)
    @cards = cards
    @category = category
  end

  def cards_in_category(category)
    @cards.keep_if {|card| card.category == @category}
  end
end
